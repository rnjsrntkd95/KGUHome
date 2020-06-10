package jiwoo.database.roomBoard;

import java.sql.SQLException;
import java.util.ArrayList;

import jiwoo.database.DBcon;

public class roomBoard {
	public DBcon db;

	public roomBoard() {
		db = new DBcon();
	}

	public void insertRoom(String title, String content, String uid, String deposit, String rent, String latitude,
		String longitude) {
		String sql = "Insert into roomboard (title,content,views,uid, deposit, rent, latitude, longitude) values(?,?,?,?,?,?,?,?)";
		System.out.println("title : " + title);

		try {
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, title);
			db.pstmt.setString(2, content);
			db.pstmt.setString(3, "0");
			db.pstmt.setString(4, uid);

			db.pstmt.setString(5, deposit);
			db.pstmt.setString(6, rent);
			db.pstmt.setString(7, latitude);
			db.pstmt.setString(8, longitude);

			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	public ArrayList<String> selectRoom() {
		String sql = "SELECT * FROM roomboard ORDER BY date, time DESC";

		ArrayList<String> result = new ArrayList<String>();
		try {
			db.stmt = db.con.createStatement();
			db.rs = db.stmt.executeQuery(sql);

			while (db.rs.next()) {
				result.add(db.rs.getString("id"));
				result.add(db.rs.getString("title"));
				result.add(db.rs.getString("content"));
				result.add(db.rs.getString("date"));
				result.add(db.rs.getString("time"));
				result.add(db.rs.getString("views"));
				result.add(db.rs.getString("uid"));
				result.add(db.rs.getString("latitude"));
				result.add(db.rs.getString("longitude"));
				result.add(db.rs.getString("deposit"));
				result.add(db.rs.getString("rent"));

			}

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

		return result;
	}

	public ArrayList<String> selectOneRoom(String id) {
		String sql = "SELECT * FROM roomboard where id=" + id;

		ArrayList<String> result = new ArrayList<String>();
		try {
			db.stmt = db.con.createStatement();
			db.rs = db.stmt.executeQuery(sql);

			while (db.rs.next()) {
				result.add(db.rs.getString("id"));
				result.add(db.rs.getString("title"));
				result.add(db.rs.getString("content"));
				result.add(db.rs.getString("date"));
				result.add(db.rs.getString("time"));
				result.add(db.rs.getString("views"));
				result.add(db.rs.getString("uid"));
				result.add(db.rs.getString("latitude"));
				result.add(db.rs.getString("longitude"));
				result.add(db.rs.getString("deposit"));
				result.add(db.rs.getString("rent"));

			}

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

		return result;
	}

	public void updateRoom(String title, String content, String deposit, String rent, String id) {
		String sql = "Update roomboard set title = ?, content = ?, deposit = ?, rent = ? where id=" + id;

		try {
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, title);
			db.pstmt.setString(2, content);
			db.pstmt.setString(3, deposit);
			db.pstmt.setString(4, rent);

			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	public void addViewCount(String id) {
		String sql = "SELECT views FROM roomboard where id=" + id;

		String result = "";
		try {
			db.stmt = db.con.createStatement();
			db.rs = db.stmt.executeQuery(sql);

			while (db.rs.next()) {
				result = db.rs.getString("views");
			}

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

		int number = Integer.parseInt(result);
		number++;

		sql = "Update roomboard set views = ? where id=" + id;

		try {
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.setString(1, Integer.toString(number));

			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	public void deleteRoom(String id) {
		String sql = "delete from roomboard where id=" + id;

		try {
			db.pstmt = db.con.prepareStatement(sql);
			db.pstmt.executeUpdate();

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

}
