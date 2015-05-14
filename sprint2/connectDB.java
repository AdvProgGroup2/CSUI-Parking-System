package sprint2;

import java.sql.*;

//to connect database to java

public class connectDB {
	
	private Connection con;
	private Statement st;
	private ResultSet rs;
	
	    public void selectData(String username, String password) {
	        try
	        {
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking", "root", "");
	             
	            //insertStmt = connection.createStatement();
	            
	            st = con.createStatement();
	            String selectSql = "SELECT username, password FROM member WHERE username='"+username+"' and password='"+password+"'";
	            rs = st.executeQuery(selectSql);
	            
//	            while(rs.next())
//	            if (rs.getInt(1) == 0){
//	            	System.out.println("Congratulations! You are now logged in.");
//	            	
//	            }else{
//	            	System.out.println("Username or Password incorrect. Please try again.");
//	            }
	            
	            checkMember(username, password);
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }finally {
	            try {
	                st.close();
	                con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
		
//	
//	public void getData() {
//		try {			
//			String query = "select * from member";
//			rs = st.executeQuery(query);
//			System.out.println("Records from Database\n");
//			while(rs.next()) {
////				String npm = rs.getString("npm");
//				String username = rs.getString("username");
//				String password = rs.getString("password");
////				String full_name = rs.getString("full_name");
//				System.out.println("Username : "+username +" \n"+
//								   "Password : "+password +" \n");
//			}
//			
//		} catch(Exception ex) {
//			System.out.println(ex);
//		}
//	}

	public void checkMember(String username, String password)
	{
	    try {
	    	String checkSql = "select count(*) from member where username = '"+username+"' and password = '"+password+"'";
	    	rs = st.executeQuery(checkSql);
	    	rs.next();
	    	if ( rs.getInt(1) == 0) {
	    	  System.out.println("Username or Password incorrect. Please try again.");
	    	} else {
	    	  System.out.println(username+ " is logged in.");
	    	}
	    } catch(Exception ex) {
	    	System.out.println(ex);
	    }
	}
}