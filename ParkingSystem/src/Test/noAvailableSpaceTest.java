package Test;

/**
 * 
 * @author hakeem
 * 
 * guest cannot check in if all the guest parking space is filled with cars.
 * 
 */

import static org.junit.Assert.*;

import org.junit.Test;
import Parking.ParkingLot;
import Parking.MainProgram;
import Parking.ParkingSpace;

public class noAvailableSpaceTest {

	@Test
	public void test() {
		ParkingLot lot = new ParkingLot();
		MainProgram.InitParkingSpace(lot);
		int guestparkid = 0;
		
		// check in 10 times
		for (int i=0; i<10; i++){
			int id=0;
			if (guestparkid==0) {
				id = 21;
			} else {
				id = guestparkid+1;
			}
			
			lot.checkin(new ParkingSpace(id));
			guestparkid = id;
		}
		
		int available = lot.getavailableguestspace();
		assertEquals(0, available);
		System.out.println("There are " + available + " numbers of Parking Space for guest left\n");
		
		System.out.println("---------------------------------------------------");
	}
}
