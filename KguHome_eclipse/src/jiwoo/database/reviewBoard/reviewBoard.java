package jiwoo.database.reviewBoard;

import jiwoo.database.DBcon;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class reviewBoard {
    public DBcon db;
    public reviewBoard(){
        db = new DBcon();
    }

    public void insertReview(String title, String content,String uid){
        String sql = "Insert into reviewboard (title,content,views,uid) values(?,?,?,?)";
        System.out.println("title : "+title);

        try{
            db.pstmt = db.con.prepareStatement(sql);
            db.pstmt.setString(1, title);
            db.pstmt.setString(2, content);
            db.pstmt.setString(3, "0");
            db.pstmt.setString(4, uid);



            db.pstmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public ArrayList<String> selectReview(){
        System.out.println("Select * Review");
        String sql = "SELECT * FROM reviewboard ORDER BY date, time DESC" ;

        ArrayList<String> result = new ArrayList<String>();
        try{
            db.stmt = db.con.createStatement();
            db.rs = db.stmt.executeQuery(sql);
            
			ResultSet reviewRs = null;
			PreparedStatement reviewStmt = null;

            while(db.rs.next()){
                result.add(db.rs.getString("id"));
                result.add(db.rs.getString("title"));
                result.add(db.rs.getString("content"));
                result.add(db.rs.getString("date"));
                result.add(db.rs.getString("time"));
                result.add(db.rs.getString("views"));
                result.add(db.rs.getString("uid"));
                
				String sql2 = "SELECT nickname FROM user WHERE uid="+db.rs.getString("uid");
	
				reviewStmt = db.con.prepareStatement(sql2);
				reviewRs = reviewStmt.executeQuery(sql2);
				
				while(reviewRs.next()) {
					result.add(reviewRs.getString("nickname"));
				}

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

    public void addViewCount(String id){
        String sql = "SELECT views FROM reviewboard where id="+id;

        String result="";
        try{
            db.stmt = db.con.createStatement();
            db.rs = db.stmt.executeQuery(sql);

            while(db.rs.next()){
                result=db.rs.getString("views");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        int number = Integer.parseInt(result);
        number++;

        sql = "Update reviewboard set views = ? where id="+id;

        try{
            db.pstmt = db.con.prepareStatement(sql);
            db.pstmt.setString(1, Integer.toString(number));

            db.pstmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public void deleteReview(String id){
        String sql = "delete from reviewboard where id="+id;

        try{
            db.pstmt = db.con.prepareStatement(sql);
            db.pstmt.executeUpdate();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
