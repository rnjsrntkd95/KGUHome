package myPageBoard;

import database.DBcon;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class myPageBoard {
    public DBcon db;
	public Statement stmt;
	public ResultSet res;    
    private String nickname = "??";
    private String userId = "??";
    private String grade = "??";
    private URL profileImage = null;
    
    public myPageBoard(){
        db = new DBcon();
    }

    public String getNickName(int uid){
    	
    	String query = "select nickname from user where uid="+uid;

        try{
        	stmt = db.con.createStatement();
        	res = stmt.executeQuery(query);
            
        	nickname = db.rs.getString("nickname");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        
        return nickname;
    }
    
	public String getID(int uid){
	    	
	    	String query = "select user_id from user where uid="+uid;
	
	        try{
	        	stmt = db.con.createStatement();
	        	res = stmt.executeQuery(query);
	            
	        	userId = db.rs.getString("user_id");
	
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	        
	        return userId;
	        
	    }
	
	public String getGrade(int uid){
    	
    	String query = "select grade from user where uid="+uid;

        try{
        	stmt = db.con.createStatement();
        	res = stmt.executeQuery(query);
            
        	grade = res.getString("grade");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        
        return grade;
    }
	
	
	public URL getProfileImage(int uid){
	    	
	    	String query = "select profile from user where uid="+uid;
	
	        try{
	        	stmt = db.con.createStatement();
	        	res = stmt.executeQuery(query);
	            
	        	profileImage = res.getURL("profile");
	
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	        
	        return profileImage;
	    }
    

}
