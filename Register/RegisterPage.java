package Register;

import java.util.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import Register.User;

public class RegisterPage {

	public static void main(String[] args) throws IOException{
		ConnectDB databaseconnect = new ConnectDB();
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		
		Scanner userinput = new Scanner(System.in);

		System.out.println("Welcome to CSUI Parking System!");
		System.out.println("Please answer these questions honestly!");

		boolean registerpage = true;
//		boolean empty = false;
//		boolean fill = true;
		
		if (registerpage == true){
			System.out.println("Please enter your full name.");
			String full_name = in.readLine();

			System.out.println("Please enter your role.");
			String role = in.readLine();
			
			System.out.println("Please enter your NPM/NIK.");
			String npm = in.readLine();
//			int npm = Integer.parseInt(in.readLine());
			
			
			System.out.println("Please enter your desired username.");
			String username = in.readLine();
			
			System.out.println("Please enter your password.");
			String pass = in.readLine();

			User users = new User(full_name, role, npm, username, pass);
			databaseconnect.insertData(npm, username, pass, full_name, role);
			System.out.println("Congratulations! You have registered into our application!");
			System.out.println(users);

			
		}
	}

}
