package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBcon {
	// MariaDB Conn
    public Connection con;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public DBcon() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://58.121.58.139:3306/KGUHOME?serverTimezone=UTC",
                    "tester1", "qwer1234");

            if (con != null) {
                System.out.println("DB access success");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("Driver load failed");
        } catch (SQLException e) {
            System.out.println("DB access failed");
            e.printStackTrace();
        }
        System.out.println();
    }


}
