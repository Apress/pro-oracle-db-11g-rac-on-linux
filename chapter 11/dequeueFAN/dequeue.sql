whenever sqlerror exit 99

accept v_db prompt "Enter TNSNames alias to connect to: "

prompt connect as sys to database &V_DB
connect sys@&V_DB as sysdba

accept v_grantee prompt "grant access for user: "

begin
  dbms_aqadm.grant_queue_privilege (
    privilege =>'DEQUEUE',
    queue_name => 'sys.SYS$SERVICE_METRICS',
    grantee => '&V_GRANTEE',
    grant_option=>FALSE);
end;
/

grant execute on dbms_aq to &V_GRANTEE;
GRANT EXECUTE ON SYS.SYS$RLBTYP to &V_GRANTEE;

declare
  subscriber sys.aq$_agent;
begin
  subscriber:=sys.aq$_agent('&V_GRANTEE',null,null);
  dbms_aqadm.add_subscriber(queue_name => 'sys.SYS$SERVICE_METRICS', subscriber=>subscriber);
end;
/

prompt connect as &V_GRANTEE to &V_DB now to create the dequeue procedure
prompt the user needs connect and create procedure privs
connect &V_GRANTEE@&V_DB

CREATE procedure get_fan_events (
  po_service out varchar2,
  po_information out varchar2) 
is
  v_dequeue_opts        DBMS_AQ.dequeue_options_t;
  v_message_properties  DBMS_AQ.message_properties_t;
  v_message_handle      RAW(16);
  v_event_msg           SYS.SYS$RLBTYP;
BEGIN
    v_dequeue_opts.consumer_name := '&V_GRANTEE';
    v_dequeue_opts.visibility := DBMS_AQ.IMMEDIATE;
    v_dequeue_opts.dequeue_mode := DBMS_AQ.REMOVE;
    DBMS_AQ.dequeue(queue_name          => 'sys.SYS$SERVICE_METRICS',
                    dequeue_options     => v_dequeue_opts,
                    message_properties  => v_message_properties,
                    payload             => v_event_msg,
                    msgid               => l_message_handle);
    po_service := l_event_msg.srv;
    po_information := l_event_msg.payload;
    COMMIT;
END;
/

prompt success!
