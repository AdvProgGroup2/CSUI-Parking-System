package Parking;
import Parking.MainProgram;

public class MapTester {
	public static void main(String[] args){
		ParkingLot lot = new ParkingLot();
	
		MainProgram.InitParkingSpace(lot);
//		lot.checkin(new ParkingSpace(1));
//		System.out.println(lot.getavailablespace());
		
		ParkingMap map = new ParkingMap(lot);
		lot.checkin(new ParkingSpace(1));
		lot.checkin(new ParkingSpace(2));
		System.out.println(lot.getavailablespace());
		
		lot.checkout(new ParkingSpace(2));
		
		System.out.println(map.getdirection());
	}
}
