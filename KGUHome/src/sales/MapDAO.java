package sales;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MapDAO {
	
	private static Connection conn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		if (conn == null) {
			String dbURL = "jdbc:mysql://localhost:3306/KGUHOME?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "4503";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}
		return conn;
	}
	
	public static void close() throws SQLException {
		if (conn != null) {
			if (!conn.isClosed()) {
				conn.close();
			}
		}
		conn = null;
	}

}
