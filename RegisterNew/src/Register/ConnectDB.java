package Register;

/**
 * @author yohana fransiska
 * 
 * Comments: This class is responsible for connecting my Java Registration page
 * with the database. The methods that I have created is responsible for connecting
 * to the database -- which is the ConnectDB() method, getData method is responsible
 * for retrieving data from the database and the InsertData is responsible for inserting
 * new data into the database. The InsertData method will is used in the register page
 * whenever a new user applies in the Parking System. 
 * 
 * In the insertData method, it handles whether the information given by the user is 
 * only an empty field, whether the information already exists or whether the information
 * is the right and new information. If the information already exists/if the npm/username
 * is already taken, this method is the method that is responsible for restricting them
 * to apply. But if the npm is new and not already taken, this method will allow the user 
 * to apply their username into the system.
 */
import java.sql.*;

public class ConnectDB {
	private Connection con;
	private Statement st;
	private ResultSet rs;
		
	public ConnectDB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking","root","");
			st  = con.createStatement();
			
		} catch(Exception ex) {
			System.out.println("Error: "+ex);
		}
	}
	
	
	public boolean getData() {
		try {			
			String query = "Select * from Member";
			rs = st.executeQuery(query);
			System.out.println("Records from Database\n");
			while(rs.next()) {
				String npm = rs.getString("npm");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String full_name = rs.getString("full_name");
				String role = rs.getString("role");
				System.out.println("NPM      : "+npm      +" \n"+
								   "Username : "+username +" \n"+
								   "Password : "+password +" \n"+
								   "Full Name: "+full_name+" \n" +
								   "Role	 : " + role + "\n");
				return true;
			}
			
		} catch(Exception ex) {
			System.out.println(ex);
			return false;
		}
		return false;
	}
	
	
	public boolean insertData(String npm, String username, String password, String full_name, String role) {
		try {
			String checkSql = "Select count(*) from member where username = '"+username+"'";
	    	rs = st.executeQuery(checkSql);
	    	rs.next();
	    	if ( rs.getInt(1) == 0) {
	    		String query = "Insert into Member(npm,username,password,full_name, role) "+
					       "values('"+npm+"','"+username+"','"+password+"','"+full_name+"','"+role+"')";						
	    		st.executeUpdate(query);
	    		System.out.println(username+" is inserted into the Database!");
	    		System.out.println("Congratulations, you're now member of CSUI parking privileges, " + username + "!\n");
	    		return true;
	    	} else {
	    	  System.out.println(username+ " already exists! Please choose another one.");
	    	  return false;
	    	}
	    } catch(Exception ex) {
	    	System.out.println(ex);
	    	return false;
	    }
	}
		
	public boolean checkMember(String username)
	{
	    try {
	    	String checkSql = "Select count(*) from member where username = '"+username+"'";
	    	rs = st.executeQuery(checkSql);
	    	rs.next();
	    	if ( rs.getInt(1) == 0) {
	    	  System.out.println(username+" doesn't exist");
	    	  return true;
	    	} else {
	    	  System.out.println(username+ " exist");
	    	  return false;
	    	}
	    } catch(Exception ex) {
	    	System.out.println(ex);
	    	return false;
	    }
	}
}
