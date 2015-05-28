package Parking;

import static org.junit.Assert.*;

import org.junit.Test;

import Parking.ConnectDB;

public class RegisterTest {

	@Test
	public void test() {
		
		//test for if the user already exists in the database.
		//Expected result should be failed and they shouldn't be
		//able to register into the system.
		ConnectDB test = new ConnectDB();
		String full_name= "Yohana Fransiska";
		String role = "Student";
		String npm = "1306439251";
		String username = "yohana.fransiska";
		String pass = "yaya";
		boolean usery = test.insertData(npm, username, pass, full_name, role);
		assertEquals(false, usery);

		//test for if the ONLY the username already exists in the database.
		//Expected result should be failed/false and they shouldn't be able
		//to register into the system because username must be unique.
		String full_name2 = "Yohanna";
		String role2 = "Student";
		String npm2 = "1300000";
		String username2 = "yohana.fransiska";
		String pass2 = "1234";
		boolean usery2 = test.insertData(npm, username, pass, full_name, role);
		assertEquals(false, usery2);
		
		//test for if the ONLY the NPM already exists in the database.
		//Expected result should be failed/false and they shouldn't be
		//able to register into the system because NPM must be unique.
		String full_name3 = "Yohanna";
		String role3 = "Student";
		String npm3 = "1306439251";
		String username3 = "yohanna";
		String pass3 = "1234";
		boolean usery3 = test.insertData(npm, username, pass, full_name, role);
		assertEquals(false, usery2);
		
		//test if the username, npm and everything is a new information
		//and does not exist in the database. The expected result is that
		//it will be a success and they can register into the system.
		String full_name1 = "new name";
		String role1 = "new role";
		String npm1 = "new npm";
		String username1 = "new username";
		String pass1 = "new pass";
		boolean usernew = test.insertData(npm1, username1, pass1, full_name1, role1);
		assertEquals(true, usernew);
		
		//test if the username exists in the database.
		//expected result should be false.
		String username5 = "hakeem";
		String pass5 = "1234";
		boolean usernew5 = test.checklogin(username5, pass5);
		assertEquals(true, usernew5);

		//test if the username doesn't exist in the database.
		//Expected result should be false.
		String username6 = "yohanna";
		String pass6 = "yaya";
		boolean usernew6 = test.checklogin(username6, pass6);
		assertEquals(false, usernew6);
		
		//test if the username if password is incorrect.
		//expected result should be false.
		String username7 = "yanuwicaksana";
		String pass7 = "yan";
		boolean usernew7 = test.checklogin(username7, pass7);
		assertEquals(false, usernew7);

	}

}
