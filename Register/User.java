package Register;

public class User {

	public String fullname, role, npm, username, password;
	
	public User(String fullname, String role, String npm, String username, String password){
		this.fullname = fullname;
		this.role = role;
		this.npm = npm;
		this.username = username;
		this.password = password;
	}
	
	public String getUserName(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public String getNPM(){
		return npm;
	}
	
	public String getRole(){
		return role;
	}
	
	public String getFullName(){
		return fullname;
	}
}
