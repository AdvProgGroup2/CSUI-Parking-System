package Parking;


import java.util.*;

import Parking.ConnectDB;

/**
 * 
 * @author yanuarwicaksana
 *
 * Comments: This class represent the main program of our system. This program interact with the user input and
 * 			 handles it based on certain events. It only containes simple UI and have a few dummy features that only
 * 			 included in purposes to test the validity of the code. 
 * 
 * 
 */
public class MainProgram {

/**
 * 	
 * @author yohanafransiska
 * 
 * Comments: I merged my register page codes with Yanuar's main program. Therefore, Yanuar's dummy
 * register now has validation for when the field is empty and also connection with the database
 * so that when there is an npm or username that is already exist in the database, that person
 * cannot register with that npm or username.
 * 
 * I also merged Cantya’s register page codes with Yanuar’s main program and adjusted the existing 
 * ConnectDB to Cantya’s code. I added the method CheckLogin in ConnectDB for the user’s log in
 * validation based on Cantya’s code. I also made adjustments so that the Cantya’s code and Yanuar’s
 * code works well together. I also connected the database with the java code from cantya, yanuar and
 * my own code so that every validation can be based on  the database.
 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ConnectDB databaseconnect = new ConnectDB();
		ParkingLot lot = new ParkingLot();
		Scanner scan = new Scanner(System.in);
		
		InitParkingSpace(lot);
//		InitMember(Membership);
		
		System.out.println("Welcome to CSUI Parking System v.01");
		System.out.println("This Program Represents Simple Application of Parking System \n");
		boolean valid = true;
		while(valid){
			System.out.println("Please Choose The Folowing Option:");
			System.out.println("1. Login");
			System.out.println("2. Sign Up");
			System.out.println("3. Exit");
			
			int mainmenu = scan.nextInt();
			
			if (mainmenu == 1){
				boolean login = true;

				if (login == true){					
					scan.nextLine();
					System.out.println("Please enter your username.");
					String username = scan.nextLine();
					
					System.out.println("Please enter your password.");
					String password = scan.nextLine();
					
				//UserLogin userlogin = new UserLogin(username, password);
				boolean valid2 = databaseconnect.checklogin(username, password);
		    	boolean checkinstat = false;
		    	int parkid = 0;
					while(valid2){
						System.out.println("What do you want to do?");
						System.out.println("1. Check Parking Space Availability");
						System.out.println("2. Check In/Out");
						System.out.println("3. Logout");
						
						int loginmenu = scan.nextInt();
						
						if (loginmenu == 1){
							int ava = lot.getavailablespace();
							System.out.println("There are " + ava + " numbers of Parking Space left\n");
						} else if(loginmenu == 2){
							if(!checkinstat){
								int id = (int) Math.random() * 30 + 1;
								//int id = 5;
								lot.checkin(new ParkingSpace(id));
								checkinstat = true;
								parkid = id;
							} else{
								lot.checkout(new ParkingSpace(parkid));
								checkinstat = false;
								parkid = 0;
							}
						} else if(loginmenu == 3){
							System.out.println("Log Out Succesful!\n");
							valid2 = false;
						}
					}
				} else System.out.println("Incorrect Username and Password combination!\n");
			} else if (mainmenu == 2){
				scan.nextLine();
				System.out.println("Please enter your full name.");
				String full_name = scan.nextLine();

				System.out.println("Please enter your role.");
				String role = scan.nextLine();
				
				System.out.println("Please enter your unique identity (NPM or Staff Identity Number).");
				String npm = scan.nextLine();
				
				System.out.println("Please enter your desired username.");
				String username = scan.nextLine();
				
				System.out.println("Please enter the password:");
				String password = scan.nextLine();
				
				if(!(full_name.equals("") || role.equals("") || npm.equals("") || username.equals("") ||
						password.equals(""))){
					//User Users = new User(full_name, role, npm, username, password);
					databaseconnect.insertData(npm, username, password, full_name, role);
				} else{
					System.out.println("Incorrect Input. Please try again!");
				}
				
			} else valid = false;
		}
		
		
	}
	
	public static void InitParkingSpace(ParkingLot lot){
		for (int i = 1; i <= 30; i++){
			ParkingSpace space = new ParkingSpace(i);
			lot.addParkingSpace(space);
		}
	}
	
//	public static void InitMember(Collection Membership){
//		User user1 = new User("Yanuar.Wicaksana", "helloworld");
//		User user2 = new User("Tsabita.Cyavrilla", "group2rules");
//		User user3 = new User("Hakeem.Daud", "Gear4th");
//		User user4 = new User("Yohanna.Kanisia", "KoreanDrama");
//		User user5 = new User("Abicantya.Sophie", "newgirl");
//		
//		Membership.add(user1);
//		Membership.add(user2);
//		Membership.add(user3);
//		Membership.add(user4);
//		Membership.add(user5);
//	}

}
