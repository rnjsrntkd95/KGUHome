package message;

import database.DBcon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class messageSend {
    public String driver = "org.mariadb.jdbc.Driver";
    public Connection con;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public DBcon db;
    public messageSend(){
        db = new DBcon();
    }

    public void insertMessage(String uid1, String uid2, String content){
        String sql = "Insert into message (uid1,uid2,content) values(?,?,?)";

        try{
            db.pstmt = db.con.prepareStatement(sql);
            db.pstmt.setInt(1, Integer.parseInt("1")); 
            db.pstmt.setInt(2, Integer.parseInt(uid2));
            db.pstmt.setString(3, content);

            db.pstmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
