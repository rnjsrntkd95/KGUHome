package user;



import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;



public class UserDAO {



	private Connection conn;

	private ResultSet rs;



	public UserDAO() {

		try {

			String dbURL = "jdbc:mysql://localhost:3306/KGUHOME?serverTimezone=UTC";

			String dbID = "root";

			String dbPassword = "4503";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	
	

	public int login(String user_id, String pwd) {

		String SQL = "SELECT pwd FROM USER WHERE user_id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				if(rs.getString(1).equals(pwd))

					return 1; // �α��� ����

				else

					return 0; // ��й�ȣ Ʋ��

			}

			return -1; // ���̵� ����

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -2; // �����ͺ��̽� ����

	}

	

	public int join(UserDTO user) {

		String SQL = "INSERT INTO USER VALUES (null, ?, ?, ?, false, ?, ?, ?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getUserID());

			pstmt.setString(2, user.getUserPassword());
			
			pstmt.setString(3, user.getGrade());

			pstmt.setString(4, user.getNickname());
			
			pstmt.setString(5, user.getUserEmail());

			pstmt.setString(6, user.getUserEmailHash());

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -1; // ȸ������ ����

	}

	

	public String getUserEmail(String user_id) {

		String SQL = "SELECT userEmail FROM USER WHERE user_id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getString(1); // �̸��� �ּ� ��ȯ

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null; // �����ͺ��̽� ����

	}

	

	public boolean getUserEmailChecked(String user_id) {

		String SQL = "SELECT certified FROM USER WHERE user_id = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getBoolean(1); 

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false;

	}

	

	public boolean setUserEmailChecked(String user_id) {

		String SQL = "UPDATE USER SET certified = true WHERE user_id = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user_id);

			pstmt.executeUpdate();

			return true; // �̸��� ��� ���� ����

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false; // �̸��� ��� ���� ����

	}

}
