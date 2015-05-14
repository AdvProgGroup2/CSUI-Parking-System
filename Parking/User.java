package Parking;
/**
 * 
 * @author yanuarwicaksana
 *
 * Comments: This class represent the dummy user membership that can login to the system.
 * 			 In the real application, each information of the user are stored inside the database.
 */
public class User {
	public String username, password, full_name, role, npm;
	
	public User(String full_name, String role, String npm, String username, String password){
		this.username = username;
		this.password = password;
		this.full_name = full_name;
		this.role = role;
		this.npm = npm;
	}
	
	public String getusername(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public String getFullName(){
		return full_name;
	}
	
	public String getRole(){
		return role;
	}
	
	public String getNPM(){
		return npm;
	}
	@Override
	public boolean equals(Object otheruser){
		boolean bool = false;
		if(otheruser != null && otheruser instanceof User){
			User other = (User) otheruser;
			bool = this.username.equals(other.username) && this.password.equals(other.password);
		}
		return bool;
	}
}
