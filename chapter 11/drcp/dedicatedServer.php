<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Dedicated Server Connection Page</title>
</head>
<body>

<table cellspacing="2" cellpadding="2" border="0">
<tr>
  <td><img src="tomcat.gif" /> </td>
  <td>
    <h1>Pro Oracle RAC 11g on Linux</h1>
    <h3>Database Resident Connection Pool Demo</h3>
  </td>
</tr>
<tr>
  <td colspan="2">
    <p>Demo showing the benefit of the database resident connection pool </p>
  </td>
</tr>
</table>

<?php
  if ( $conn=OCILogon("username", "password", "nondrcp")) {
    echo "Successfully connected to Oracle.\n";

    // get the instance information
    $stid = oci_parse($conn, "select sys_context('userenv','instance_name'), sys_context('userenv','service_name') inst from dual");
    $r = oci_execute($stid);

    while (($row = oci_fetch_array($stid, OCI_BOTH))) {
        echo "<p>You are connected to instance " . $row[0] . " using service " . $row[1] .  "</p>";
    }

    oci_free_statement($stid);

    OCILogoff($conn);
  } else {
    $err = OCIError();
    echo "Error in connecting to the Oracle." . $err["message"];
  }
?>

</body>
</html>
