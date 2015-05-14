package sprint2;

import java.util.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import sprint2.information;

public class LogIn {
	
	private String username;
    private char[] password;
    private boolean debug = false;
    private boolean succeeded = false;
	
	public static void main(String[] args) throws IOException{
		connectDB databaseconnect = new connectDB();
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

		System.out.println("Welcome to CSUI Parking System!");

		boolean login = true;

		if (login == true){					
			
			System.out.println("Please enter your username.");
			String username = in.readLine();
			
			System.out.println("Please enter your password.");
			String password = in.readLine();
			
			information info = new information(username, password);
			databaseconnect.selectData(username, password);

		}
	}
}
