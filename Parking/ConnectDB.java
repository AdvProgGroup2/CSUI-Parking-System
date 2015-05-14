package Parking;

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
	
	
	public void getData() {
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
			}
			
		} catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	
	public void insertData(String npm, String username, String password, String full_name, String role) {
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
	    	} else {
	    		System.out.println(username+ " already exists! Please choose another one.");
	    	}
	    } catch(Exception ex) {
	    	System.out.println(ex);
	    }

	}
		
	
	public void checkMember(String username)
	{
	    try {
	    	String checkSql = "Select count(*) from member where username = '"+username+"'";
	    	rs = st.executeQuery(checkSql);
	    	rs.next();
	    	if ( rs.getInt(1) == 0) {
	    	  System.out.println(username+" doesn't exist");
	    	} else {
	    	  System.out.println(username+ " exist");
	    	}
	    } catch(Exception ex) {
	    	System.out.println(ex);
	    }
	}
	    
	    public boolean checklogin(String username, String password){
	    	try {
		    	String checkSql = "select count(*) from member where username = '"+username+"' and password = '"+password+"'";
		    	rs = st.executeQuery(checkSql);
		    	rs.next();
		    	if ( rs.getInt(1) == 0) {
		    	  System.out.println("Username or Password incorrect. Please try again.");
		    	  return false;
		    	} else {
		    	  System.out.println(username+ " is logged in.");
		    	  return true;
		    	}
		    } catch(Exception ex) {
		    	System.out.println(ex);
		    	return true;
		    }   
		}
}

