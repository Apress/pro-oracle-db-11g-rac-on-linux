package com.apress.racbook.wlm.ucp;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import oracle.ucp.jdbc.PoolDataSourceFactory;
import oracle.ucp.jdbc.PoolDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.Properties;

public class UCPDemo {

	private		Context					envContext, initContext;
	private		PoolDataSource	pds = null;
	
	public UCPDemo(String jndiName)  
		throws NamingException, SQLException
	{
		initContext = new InitialContext();
		envContext = (Context) initContext.lookup("java:comp/env");

		pds = (PoolDataSource)envContext.lookup(jndiName);
	}
	
	private Connection getConnection()  
		throws SQLException
	{
		return pds.getConnection();
	}
	
	public String getInstance() 
		throws SQLException
	{
		String instName = "";
		
		try {
			Connection conn = this.getConnection();
			Statement stmt = conn.createStatement(); 
			ResultSet rst = stmt.executeQuery("select sys_context('userenv','instance_name') from dual");
			
			rst.next();
			instName = rst.getString(1);

			// return the connection to the pool
			stmt.close();
			conn.close();
			conn = null;
		} catch (SQLException sqlexception) {
			instName = sqlexception.toString();
		}
		
		return instName;
	}

	public PoolDataSource getPDS()  {
		return this.pds;
	}
}

