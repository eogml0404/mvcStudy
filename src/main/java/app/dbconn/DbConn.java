package app.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConn {
	private String url ="jdbc:mysql://@localhost:3306/mysql?serverTimezone=UTC&useSSL=false";
	private String user="root";
	private String password="1234";

	
	public Connection getConnection() {
		Connection conn = null;
		
	
		try {
			//Connection 연결객체 정보를 담는 연결정보객체
			//DriverManager 연결정보를 가지고 올라와있는 OracleDriver정보에 접속객체
			Class clz = Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection(url, user, password);
	
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return conn;
	}
	
	
	//out.println("conn정보가 있나요?"+conn);
}
