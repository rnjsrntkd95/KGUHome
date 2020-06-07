package jiwoo.reviewBoard;

import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;
import jiwoo.database.DBcon;

import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;

public class reviewBoard {
    public DBcon db;
    public reviewBoard(){
        db = new DBcon();
    }

    public void insertReview(String title, String content){
        String sql = "Insert into reviewboard (title,content,views,uid) values(?,?,?,?)";

        try{
            db.pstmt = db.con.prepareStatement(sql);
            db.pstmt.setString(1, title);
            db.pstmt.setString(2, content);
            db.pstmt.setString(3, "0");
            db.pstmt.setString(4, "1");

            db.pstmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public ArrayList<String> selectReview(){
        System.out.println("Select * Review");
        String sql = "SELECT * FROM reviewboard ORDER BY date, time";

        ArrayList<String> result = new ArrayList<String>();
        try{
            db.stmt = db.con.createStatement();
            db.rs = db.stmt.executeQuery(sql);

            while(db.rs.next()){
                result.add(db.rs.getString("id"));
                result.add(db.rs.getString("title"));
                result.add(db.rs.getString("content"));
                result.add(db.rs.getString("date"));
                result.add(db.rs.getString("time"));
                result.add(db.rs.getString("views"));
                result.add(db.rs.getString("uid"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return result;
    }

    public ArrayList<String> selectOneReview(String id){
        System.out.println("Select * One Review");
        System.out.println("id : "+id);
        String sql = "SELECT * FROM reviewboard where id="+id;

        ArrayList<String> result = new ArrayList<String>();
        try{
            db.stmt = db.con.createStatement();
            db.rs = db.stmt.executeQuery(sql);

            while(db.rs.next()){
                result.add(db.rs.getString("id"));
                result.add(db.rs.getString("title"));
                result.add(db.rs.getString("content"));
                result.add(db.rs.getString("date"));
                result.add(db.rs.getString("time"));
                result.add(db.rs.getString("views"));
                result.add(db.rs.getString("uid"));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return result;
    }

    public void updateReview(String title, String content, String id){
        String sql = "Update reviewboard set title = ?, content = ? where id="+id;
        System.out.println("title : "+title);
        System.out.println("content : "+content);
        System.out.println("id : "+id);
        try{
            db.pstmt = db.con.prepareStatement(sql);
            db.pstmt.setString(1, title);
            db.pstmt.setString(2, content);

            db.pstmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
