package Parking;

import java.util.*;

import Parking.User;
/**
 * 
 * @author yanuarwicaksana
 *
 * Comments: This class represent the main program of our system. This program interact with the user input and
 * 			 handles it based on certain events. It only containes simple UI and have a few dummy features that only
 * 			 included in purposes to test the validity of the code. 
 */
public class MainProgram {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList Membership = new LinkedList();
		ParkingLot lot = new ParkingLot();
		Scanner scan = new Scanner(System.in);
		
		InitParkingSpace(lot);
		InitMember(Membership);
		
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
				scan.nextLine();
				System.out.println("Please enter your username:");
				String username = scan.nextLine();
				
				System.out.println("Please enter your password:");
				String password = scan.nextLine();
				
				User user = new User(username, password);
				if (Membership.contains(user)){
					System.out.println("Welcome Back " + username + "!\n");
					boolean checkinstat = false;
					int parkid = 0;
					boolean valid2 = true;
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
				System.out.println("Please enter the designated username:");
				String Username = scan.nextLine();
				
				System.out.println("Please enter the password:");
				String Password = scan.nextLine();
				
				User Users = new User(Username,Password);
				Membership.add(Users);
				System.out.println("Congratulations, you're now member of CSUI parking privileges " + Username + "!\n");
			} else valid = false;
		}
		
		
	}
	
	public static void InitParkingSpace(ParkingLot lot){
		for (int i = 1; i <= 30; i++){
			ParkingSpace space = new ParkingSpace(i);
			lot.addParkingSpace(space);
		}
	}
	
	public static void InitMember(Collection Membership){
		User user1 = new User("Yanuar.Wicaksana", "helloworld");
		User user2 = new User("Tsabita.Cyavrilla", "group2rules");
		User user3 = new User("Hakeem.Daud", "Gear4th");
		User user4 = new User("Yohanna.Kanisia", "KoreanDrama");
		User user5 = new User("Abicantya.Sophie", "newgirl");
		
		Membership.add(user1);
		Membership.add(user2);
		Membership.add(user3);
		Membership.add(user4);
		Membership.add(user5);
	}

}
