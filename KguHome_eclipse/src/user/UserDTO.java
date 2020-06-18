package user;



public class UserDTO {


	private int uid;
	private String user_id;
	private String grade;
	private String nickname;
	private String pwd;

	private String userEmail;

	private String userEmailHash;

	private boolean certified;


	public String getNickname() {
        return nickname;
    }
	
	
    public void setNickname(String nickname) {
        this.nickname= nickname;
    }
	
	public String getGrade() {
        return grade;
    }
	
	
    public void setGrade(String grade) {
        this.grade= grade;
    }
    
    
	public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid= uid;
    }
    
	public String getUserID() {

		return user_id;

	}

	public void setUserID(String user_id) {

		this.user_id = user_id;

	}

	public String getUserPassword() {

		return pwd;

	}

	public void setUserPassword(String pwd) {

		this.pwd = pwd;

	}

	public String getUserEmail() {

		return userEmail;

	}

	public void setUserEmail(String userEmail) {

		this.userEmail = userEmail;

	}

	public String getUserEmailHash() {

		return userEmailHash;

	}

	public void setUserEmailHash(String userEmailHash) {

		this.userEmailHash = userEmailHash;

	}

	public boolean isUserEmailChecked() {

		return certified;

	}

	public void setUserEmailChecked(boolean certified) {

		this.certified = certified;

	}

	

	public UserDTO(int uid, String user_id, String pwd, String grade, boolean certified, String nickname, String userEmail,

			String userEmailHash) {

		this.uid=uid;
		
		this.nickname = nickname;
		
		this.grade=grade;
		
		this.user_id = user_id;

		this.pwd = pwd;

		this.userEmail = userEmail;

		this.userEmailHash = userEmailHash;

		this.certified = certified;

	}



}
