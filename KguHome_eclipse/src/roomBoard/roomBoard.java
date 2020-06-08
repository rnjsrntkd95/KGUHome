package roomBoard;

import database.DBcon;

import java.sql.SQLException;

public class roomBoard {
    public DBcon db;
    public roomBoard(){
        db = new DBcon();
    }

    public void insertReview(String title, String content){
        String sql = "Insert into roomboard (title,content,views,uid) values(?,?,?,?)";

        try{
            db.pstmt = db.con.prepareStatement(sql);
            db.pstmt.setString(1, title);
            db.pstmt.setString(2, content);
            db.pstmt.setString(3, "0");
            db.pstmt.setString(4, "0");

            db.pstmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
