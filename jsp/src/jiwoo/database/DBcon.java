package jiwoo.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBcon {
    public String driver = "org.mariadb.jdbc.Driver";
    public Connection con;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public DBcon() {
        try {
            Class.forName(driver);
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


}

