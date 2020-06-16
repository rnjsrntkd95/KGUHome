package jiwoo.database;

import java.sql.*;

public class DBcon {
    public String driver = "com.mysql.cj.jdbc.Driver";
    public Connection con;
    public PreparedStatement pstmt;
    public Statement stmt;
    public ResultSet rs;

    public DBcon() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(
            		"jdbc:mysql://58.121.58.139:3306/KGUHOME?serverTimezone=UTC",
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


}
