package jiwoo.database.infoBoard;

import jiwoo.database.DBcon;

import java.sql.SQLException;
import java.util.ArrayList;

public class infoBoard {
	public DBcon db;
	public infoBoard(){
		db = new DBcon();
	}

	public void insertInfo(String title, String content,String uid){
		String sql = "Insert into infoboard (title,content,views,uid) values(?,?,?,?)";

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
	public ArrayList<String> selectInfo(){
		String sql = "SELECT * FROM infoboard ORDER BY date, time DESC" ;

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

	public ArrayList<String> selectOneInfo(String id){

		String sql = "SELECT * FROM infoboard where id="+id;

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

	public void updateInfo(String title, String content, String id){
		String sql = "Update infoboard set title = ?, content = ? where id="+id;
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
		String sql = "SELECT views FROM infoboard where id="+id;

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

		sql = "Update infoboard set views = ? where id="+id;

		try{
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, Integer.toString(number));

			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	public void deleteInfo(String id){
		String sql = "delete from infoboard where id="+id;

		try{
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

}
