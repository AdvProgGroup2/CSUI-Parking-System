package Test;
/**
 * 
 * @author hakeem
 *
 * Guest can only park in CSUI Parking lot that has parking space id = 21-30.
 * So guest have 10 maximum parking space.
 * 
 */
import static org.junit.Assert.*;

import org.junit.Test;
import Parking.ParkingLot;
import Parking.ParkingSpace;

public class idTest {

	@Test
	public void test() {
		ParkingLot lot = new ParkingLot();
		
		ParkingSpace id1 = new ParkingSpace(1);   // id=1
		ParkingSpace id13 = new ParkingSpace(13); // id=13
		ParkingSpace id21 = new ParkingSpace(21); // id=21
		ParkingSpace id30 = new ParkingSpace(30); // id=30
		
		lot.addParkingSpace(id1); //add space with id=1 into parking lot
		int output = lot.getavailableguestspace();
		assertEquals(0, output);
		System.out.println("available parking space for guest is " + output);
		
		lot.addParkingSpace(id13); //add space with id=13 into parking lot
		output = lot.getavailableguestspace();
		assertEquals(0, output);
		System.out.println("available parking space for guest is " + output);
		
		lot.addParkingSpace(id21); //add space with id=21 into parking lot
		output = lot.getavailableguestspace();
		assertEquals(1, output);
		System.out.println("available parking space for guest is " + output);
		
		lot.addParkingSpace(id30); //add space with id=30 into parking lot
		output = lot.getavailableguestspace();
		assertEquals(2, output);
		System.out.println("available parking space for guest is " + output);
		
		System.out.println("---------------------------------------------------");
	}

}
