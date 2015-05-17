package Register;

/**
 * 
 * @author yohanafransiska
 * 
 * Comments: This is the register page that I have converted from the PHP file that
 * I did in the first sprint. Now the register page has already connected with the
 * database. It validates whether the users filled the information. If it is empty,
 * the program will ask for the user to fill in their information and not let any
 * of the field empty. 
 * 
 * Based on the database, the primary key is the NPM therefore there should not be 
 * any duplication for the NPM. However, I added another information that also must
 * be unique which is the username. It is validated in the 'insertdata' method from
 * the connectDb class. If the username is duplicated also, they must choose a new
 * username that does not already exist in the database.
 */
import java.util.*;

import Register.User;

public class RegisterPage {

	public static void main(String[] args){
		ConnectDB databaseconnect = new ConnectDB();
		
		Scanner userinput = new Scanner(System.in);

		System.out.println("Welcome to CSUI Parking System!");
		System.out.println("Please answer these questions honestly!");

		boolean registerpage = true;
		
		while(registerpage){
			
			System.out.println("Please enter your full name.");
			String full_name = userinput.nextLine();
			
			System.out.println("Please enter your role.");
			String role = userinput.nextLine();
				
			System.out.println("Please enter your NPM/NIK.");
			String npm = userinput.nextLine();
					
			System.out.println("Please enter your desired username.");
			String username = userinput.nextLine();
						
			System.out.println("Please enter your password.");
			String pass = userinput.nextLine();
						
			
			if(!(full_name.equals("") || role.equals("") || npm.equals("") || username.equals("") ||
					pass.equals(""))){
				User users = new User(full_name, role, npm, username, pass);
			
				boolean bool = databaseconnect.insertData(npm, username, pass, full_name, role);
				if (bool) break;
			} else{
				System.out.println("Incorrect Input. Please try again!");
			}
		}
	}

}
