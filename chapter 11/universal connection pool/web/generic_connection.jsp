<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.apress.racbook.wlm.ucp.*" %>
<%@ page import="oracle.ucp.jdbc.oracle.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<style type="text/css">
		table	{ font-family:sans-serif;font-size:small }
		th	{ background-color:#cecece }
	</style>
	<title>Generic Connection Page</title>
</head>
<body>

<table cellspacing="2" cellpadding="2" border="0">
<tr>
<td><img src="images/tomcat.gif" /></td>
<td>

<h1>Pro Oracle RAC 11g on Linux</h1>

<h3>UCP Connection Pool Demo</h3>
</td>
</tr>
<tr>
<td colspan="2">
<p>
This demo uses a resource defined in context.xml to connect to a UCP connection pool using an Oracle 11.2 RAC database. 
</p>
</td>
</tr>
</table>

<% 
String jndiName = request.getParameter("jndiName");
if (jndiName != null)	{ 

%>	
<h2>Connecting to JNDI Name <%= jndiName %></h2>
<%	

UCPDemo ucp;
ucp = new UCPDemo(jndiName);

%>

<p>You are connected to instance <%= ucp.getInstance() %></p>

<h3>Statistics</h3>

<table width="100%" cellspacing="2" cellpadding="2" >
<tr>
  <th colspan="4">Pooled Data Source Connection</th><tr>
</tr>
<tr>
  <td> getAbandonedConnectionTimeout()   </td>
  <td> <%= ucp.getPDS().getAbandonedConnectionTimeout() %>  </td>
  <td> getAvailableConnectionsCount()    </td>
  <td> <%= ucp.getPDS().getAvailableConnectionsCount()  %>  </td>
</tr>
<tr> 
  <td> getBorrowedConnectionsCount()     </td>
  <td  <%= ucp.getPDS().getBorrowedConnectionsCount()  %> </td>
  <td> getConnectionFactoryClassName()   </td>
  <td> <%= ucp.getPDS().getConnectionFactoryClassName()  %> </td>
</tr>
<tr>
  <td> getConnectionHarvestMaxCount()    </td>
  <td> <%= ucp.getPDS().getConnectionHarvestMaxCount()  %> </td>
  <td> getConnectionHarvestTriggerCount()</td>
  <td> <%= ucp.getPDS().getConnectionHarvestTriggerCount()  %> </td>
</tr>
<tr>
  <td> getConnectionPoolName()           </td>
  <td> <%= ucp.getPDS().getConnectionPoolName()  %> </td>
  <td> getConnectionWaitTimeout()        </td>
  <td> <%= ucp.getPDS().getConnectionWaitTimeout()  %> </td>
</tr>
<tr>
  <td> getDatabaseName()                 </td>
  <td> <%= ucp.getPDS().getDatabaseName()  %> </td> 
  <td> getDataSourceName()               </td>
  <td> <%= ucp.getPDS().getDataSourceName()  %> </td>
</tr>
<tr>
  <td> getDescription()                  </td>
  <td> <%= ucp.getPDS().getDescription()  %> </td>
  <td> getFastConnectionFailoverEnabled()</td>
  <td> <%= ucp.getPDS().getFastConnectionFailoverEnabled()  %> </td>
</tr>
<tr>
  <td> getInactiveConnectionTimeout()    </td>
  <td> <%= ucp.getPDS().getInactiveConnectionTimeout()  %> </td>
  <td> getInitialPoolSize()              </td>
  <td> <%= ucp.getPDS().getInitialPoolSize()  %> </td>
</tr>
<tr>
  <td> getMaxConnectionReuseCount()      </td>
  <td> <%= ucp.getPDS().getMaxConnectionReuseCount()  %> </td>
  <td> getMaxConnectionReuseTime()       </td>
  <td> <%= ucp.getPDS().getMaxConnectionReuseTime() %> </td>
</tr>
<tr>
  <td> getMaxIdleTime()                  </td>
  <td> <%= ucp.getPDS().getMaxIdleTime()  %> </td>
  <td> getMaxPoolSize()                  </td>
  <td> <%= ucp.getPDS().getMaxPoolSize()  %> </td>
</tr>
<tr>
  <td> getMinPoolSize()                  </td>
  <td> <%= ucp.getPDS().getMinPoolSize()  %> </td>
  <td> getONSConfiguration()             </td>
  <td> <%= ucp.getPDS().getONSConfiguration()  %> </td>
</tr>
<tr>
  <td> getServerName()                   </td>
  <td> <%= ucp.getPDS().getServerName()  %> </td> </td>
  <td> getTimeoutCheckInterval()         </td>
  <td> <%= ucp.getPDS().getTimeoutCheckInterval()  %> </td>
</tr>
<tr>
  <td> getTimeToLiveConnectionTimeout()  </td>
  <td> <%= ucp.getPDS().getTimeToLiveConnectionTimeout()  %> </td>
  <td> getValidateConnectionOnBorrow()   </td>
  <td> <%= ucp.getPDS().getValidateConnectionOnBorrow()  %> </td>
</tr>
<tr><th colspan="4">Connection Pool Statistics</th>
</tr>
<tr>
  <td> getAbandonedConnectionsCount()         </td>
  <td> <%= ucp.getPDS().getStatistics().getAbandonedConnectionsCount() %>  </td>
  <td> getAvailableConnectionsCount()         </td>
  <td> <%= ucp.getPDS().getStatistics().getAvailableConnectionsCount() %>  </td>
</tr>
<tr>
  <td> getAverageBorrowedConnectionsCount()   </td>
  <td> <%= ucp.getPDS().getStatistics().getAverageBorrowedConnectionsCount() %>  </td>
  <td> getAverageConnectionWaitTime()         </td>
  <td> <%= ucp.getPDS().getStatistics().getAverageConnectionWaitTime() %>  </td>
</tr>
<tr>
  <td> getBorrowedConnectionsCount()          </td>
  <td> <%= ucp.getPDS().getStatistics().getBorrowedConnectionsCount() %>  </td>
  <td> getConnectionsClosedCount()            </td>
  <td> <%= ucp.getPDS().getStatistics().getConnectionsClosedCount() %>  </td>
</tr>
<tr>
  <td> getAbandonedConnectionsCount()         </td>
  <td> <%= ucp.getPDS().getStatistics().getAbandonedConnectionsCount() %>  </td>
  <td> getConnectionsCreatedCount()           </td>
  <td> <%= ucp.getPDS().getStatistics().getConnectionsCreatedCount() %>  </td>
</tr>
<tr>
  <td> getCumulativeConnectionBorrowedCount() </td>
  <td> <%= ucp.getPDS().getStatistics().getCumulativeConnectionBorrowedCount() %>  </td>
  <td> getCumulativeConnectionUseTime()       </td>
  <td> <%= ucp.getPDS().getStatistics().getCumulativeConnectionUseTime() %>  </td>
</tr>
<tr>
  <td> getCumulativeConnectionWaitTime()      </td>
  <td> <%= ucp.getPDS().getStatistics().getCumulativeConnectionWaitTime() %>  </td>
  <td> getPeakConnectionsCount()              </td>
  <td> <%= ucp.getPDS().getStatistics().getPeakConnectionsCount() %>  </td>
</tr>
<tr>
  <td> getPendingRequestsCount()              </td>
  <td> <%= ucp.getPDS().getStatistics().getPendingRequestsCount() %>  </td>
  <td> getRemainingPoolCapacityCount()        </td>
  <td> <%= ucp.getPDS().getStatistics().getRemainingPoolCapacityCount() %>  </td>
</tr>
<tr>
  <td> getTotalConnectionsCount()             </td><td colspan="3"> <%= ucp.getPDS().getStatistics().getTotalConnectionsCount() %>  </td>
</tr>
<tr><th colspan="4">RAC specific</th><tr>
</tr>

<tr>
  <td> getFCFProcessingInfo()               </td>
  <td> <%= ((OracleJDBCConnectionPoolStatistics)ucp.getPDS().getStatistics()).getFCFProcessingInfo() %>  </td>
    
  <td> getFailedRCLBBasedBorrowCount()      </td>
  <td> <%= ((OracleJDBCConnectionPoolStatistics)ucp.getPDS().getStatistics()).getFailedRCLBBasedBorrowCount() %>  </td>
</tr>
<tr>
  <td> getSuccessfulRCLBBasedBorrowCount()  </td>
  <td> <%= ((OracleJDBCConnectionPoolStatistics)ucp.getPDS().getStatistics()).getSuccessfulRCLBBasedBorrowCount() %>  </td>
    
  <td> getFailedAffinityBasedBorrowCount()  </td>
  <td> <%= ((OracleJDBCConnectionPoolStatistics)ucp.getPDS().getStatistics()).getFailedAffinityBasedBorrowCount() %>  </td>
</tr>
<tr>
  <td> getSuccessfulAffinityBasedBorrowCount()  </td><td colspan="3"> <%= ((OracleJDBCConnectionPoolStatistics)ucp.getPDS().getStatistics()).getSuccessfulAffinityBasedBorrowCount() %>  </td>
</tr>

</table>


<%
} 
%>
<!--  This is the part where we define the jndi name to connect to -->
<hr/>

<h3>Specify Connection Information</h3>



<form action="generic_connection.jsp">

<table>
<tr>
	
  <td>Connect to jndi Name: </td>
	
  <td><input type="text" name="jndiName" value="<%= jndiName %>"/></td>
	<td colspan="2"><input type="submit" /></td>

</tr>
</table>

</form>



</body>
</html>
