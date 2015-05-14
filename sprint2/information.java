package sprint2;

public class information {
	
	public String username, password;
	
	public information(String username, String password){
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
