package sprint2_hakeem;
/**
 * 
 * @author yanuarwicaksana
 *
 * Comments: This class represent the dummy user membership that can login to the system.
 * 			 In the real application, each information of the user are stored inside the database.
 */
public class User {
	public String username,password;
	
	public User(String username, String password){
		this.username = username;
		this.password = password;
	}
	
	public String getusername(){
		return username;
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
