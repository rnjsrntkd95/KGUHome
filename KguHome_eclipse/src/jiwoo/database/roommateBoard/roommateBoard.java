package jiwoo.database.roommateBoard;

import jiwoo.database.DBcon;

import java.sql.SQLException;
import java.util.ArrayList;

public class roommateBoard {
	public DBcon db;
	public roommateBoard(){
		db = new DBcon();
	}

	public void insertRoommate(String title, String content){
		String sql = "Insert into roommateboard (title,content,views,uid) values(?,?,?,?)";

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
	public ArrayList<String> selectRoommate(){
		String sql = "SELECT * FROM roommateboard ORDER BY date, time DESC" ;

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

	public ArrayList<String> selectOneRoommate(String id){

		String sql = "SELECT * FROM roommateboard where id="+id;

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

	public void updateRoommate(String title, String content, String id){
		String sql = "Update roommateboard set title = ?, content = ? where id="+id;
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
		String sql = "SELECT views FROM roommateboard where id="+id;

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

		sql = "Update roommateboard set views = ? where id="+id;

		try{
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, Integer.toString(number));

			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	public void deleteRoommate(String id){
		String sql = "delete from roommateboard where id="+id;

		try{
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

}
