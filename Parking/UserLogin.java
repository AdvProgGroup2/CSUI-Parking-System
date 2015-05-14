package Parking;

public class UserLogin {

public String fullname, role, npm, username, password;
	
	public UserLogin(String username, String password){
		this.username = username;
		this.password = password;
	}
	
	public String getUserName(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}

}
