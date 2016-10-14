<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="javax.naming.Context, javax.naming.InitialContext, java.io.Serializable, java.sql.Connection" %>
<%@page import="java.sql.SQLException,java.sql.ResultSet,java.sql.Statement, java.util.Properties" %>
<%@page import="oracle.ucp.jdbc.PoolDataSourceFactory, oracle.ucp.jdbc.PoolDataSource, oracle.ucp.jdbc.oracle.OracleJDBCConnectionPoolStatistics " %>

<html>
	<head><title>Connection pool Stats</title></head>
	<style type="text/css">
		body  { font-familily : arial; font-size: 12pt; }
		table { font-familily : arial; font-size: 10pt; }
	</style>
<body>

<h1> Connection Pool Stats </h1>

<%
String jndiName = request.getParameter("name");

if (jndiName == null)	{ 
	jndiName = "jdbc/ucp";
} 


PoolDataSource pds = null;

try {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		pds = (PoolDataSource) envContext.lookup(jndiName);     

		if (envContext == null) throw new Exception("Error: No Context");
		if (pds == null) throw new Exception("Error: No DataSource");
		
} catch (Exception e) {
	e.printStackTrace();
}
 
%>

<p>Here are the stats</p>



<table border="1" cellpadding="2" cellspacing="2">
<tr><td> getAbandonedConnectionTimeout() </td><td> <%= pds.getAbandonedConnectionTimeout() %>  </td></tr>
<tr><td> getAvailableConnectionsCount() </td><td>  <%= pds.getAvailableConnectionsCount()  %>  </td></tr>
<tr><td> getBorrowedConnectionsCount() </td><td>  <%= pds.getBorrowedConnectionsCount()  %> </td></tr>
<tr><td> getConnectionFactoryClassName() </td><td> <%= pds.getConnectionFactoryClassName()  %> </td></tr>
<tr><td> getConnectionHarvestMaxCount() </td><td> <%= pds.getConnectionHarvestMaxCount()  %> </td></tr>
<tr><td> getConnectionHarvestTriggerCount() </td><td> <%= pds.getConnectionHarvestTriggerCount()  %> </td></tr>
<tr><td> getConnectionPoolName() </td><td> <%= pds.getConnectionPoolName()  %> </td></tr>
<tr><td> getConnectionWaitTimeout() </td><td> <%= pds.getConnectionWaitTimeout()  %> </td></tr>
<tr><td> getDatabaseName() </td><td> <%= pds.getDatabaseName()  %> </td></tr> 
<tr><td> getDataSourceName() </td><td> <%= pds.getDataSourceName()  %> </td></tr>
<tr><td> getDescription() </td><td> <%= pds.getDescription()  %> </td></tr>
<tr><td> getFastConnectionFailoverEnabled()</td><td>  <%= pds.getFastConnectionFailoverEnabled()  %> </td></tr>
<tr><td> getInactiveConnectionTimeout() </td><td> <%= pds.getInactiveConnectionTimeout()  %> </td></tr>
<tr><td> getInitialPoolSize() </td><td> <%= pds.getInitialPoolSize()  %> </td></tr>
<tr><td> getMaxConnectionReuseCount() </td><td>  <%= pds.getMaxConnectionReuseCount()  %> </td></tr>
<tr><td> getMaxConnectionReuseTime() </td><td> <%= pds.getMaxConnectionReuseTime() %> </td></tr>
<tr><td> getMaxIdleTime() </td><td> <%= pds.getMaxIdleTime()  %> </td></tr>
<tr><td> getMaxPoolSize() </td><td> <%= pds.getMaxPoolSize()  %> </td></tr>
<tr><td> getMinPoolSize() </td><td> <%= pds.getMinPoolSize()  %> </td></tr>
<tr><td> getONSConfiguration() </td><td> <%= pds.getONSConfiguration()  %> </td></tr>
<tr><td> getServerName() </td><td> <%= pds.getServerName()  %> </td></tr> </td></tr>
<tr><td> getTimeoutCheckInterval() </td><td> <%= pds.getTimeoutCheckInterval()  %> </td></tr>
<tr><td> getTimeToLiveConnectionTimeout() </td><td> <%= pds.getTimeToLiveConnectionTimeout()  %> </td></tr>
<tr><td> getValidateConnectionOnBorrow() </td><td> <%= pds.getValidateConnectionOnBorrow()  %> </td></tr>
</table>

<h2>Additional information</h2>

<table border="1" cellpadding="2" cellasping="2">

<tr><td> getSuccessfulRCLBBasedBorrowCount </td><td> <%= ((OracleJDBCConnectionPoolStatistics)pds.getStatistics()).getSuccessfulRCLBBasedBorrowCount() %> </td>
<tr><td> getSuccessfulAffinityBasedBorrowCount </td><td> <%= ((OracleJDBCConnectionPoolStatistics)pds.getStatistics()).getSuccessfulAffinityBasedBorrowCount() %> </td>
<tr><td> getFCFProcessingInfo </td><td> <%= ((OracleJDBCConnectionPoolStatistics)pds.getStatistics()).getFCFProcessingInfo() %> </td>
<tr><td> getFailedRCLBBasedBorrowCount </td><td> <%= ((OracleJDBCConnectionPoolStatistics)pds.getStatistics()).getFailedRCLBBasedBorrowCount() %> </td>
<tr><td> getFailedAffinityBasedBorrowCount </td><td> <%= ((OracleJDBCConnectionPoolStatistics)pds.getStatistics()).getFailedAffinityBasedBorrowCount() %> </td>

</table>

</body>
</html>
