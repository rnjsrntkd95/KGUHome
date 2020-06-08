package hyeyeon.myPageBoard;

import hyeyeon.database.DBcon;

import java.net.URL;
import java.sql.SQLException;

public class myPageBoard {
    public DBcon db;
    
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
        	db.stmt = db.con.createStatement();
        	db.rs = db.stmt.executeQuery(query);
            
        	nickname = db.rs.getString("nickname");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        
        return nickname;
    }
    
	public String getID(int uid){
	    	
	    	String query = "select user_id from user where uid="+uid;
	
	        try{
	        	db.stmt = db.con.createStatement();
	        	db.rs = db.stmt.executeQuery(query);
	            
	        	userId = db.rs.getString("user_id");
	
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	        
	        return userId;
	        
	    }
	
	public String getGrade(int uid){
    	
    	String query = "select grade from user where uid="+uid;

        try{
        	db.stmt = db.con.createStatement();
        	db.rs = db.stmt.executeQuery(query);
            
        	grade = db.rs.getString("grade");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        
        return grade;
    }
	
	
	public URL getProfileImage(int uid){
	    	
	    	String query = "select profile from user where uid="+uid;
	
	        try{
	        	db.stmt = db.con.createStatement();
	        	db.rs = db.stmt.executeQuery(query);
	            
	        	profileImage = db.rs.getURL("profile");
	
	        } catch (SQLException throwables) {
	            throwables.printStackTrace();
	        }
	        
	        return profileImage;
	    }
    

}
