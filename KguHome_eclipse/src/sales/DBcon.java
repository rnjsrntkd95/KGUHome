package sales;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBcon {
	// MySQL conn
	private static Connection conn;
	// MariaDB Conn
    public Connection con;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public DBcon() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3306/kguhome",
                    "tester1",
                    "qwer1234");

            if (con != null) {
                System.out.println("DB access success");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("Driver load failed");
        } catch (SQLException e) {
            System.out.println("DB access failed");
            e.printStackTrace();
        }
    }
    
    // MySQL
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
