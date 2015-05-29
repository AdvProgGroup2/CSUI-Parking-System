package Test;

/**
 * 
 * @author hakeem
 *
 * The first guest to check in must park in id 21.
 * The number available parking space decrease when check in.
 * 
 */

import static org.junit.Assert.*;

import org.junit.Test;
import Parking.ParkingLot;
import Parking.MainProgram;
import Parking.ParkingSpace;

public class checkInTest {

	@Test
	public void test() {
		ParkingLot lot = new ParkingLot();
		MainProgram.InitParkingSpace(lot);
		int guestparkid = 0;
		
		int available = lot.getavailableguestspace();
		assertEquals(10, available);
		System.out.println("There are " + available + " numbers of Parking Space for guest left\n");
		
		int id=0;
		if (guestparkid==0) {
			id = 21;
		} else {
			id = guestparkid+1;
		}
		
		lot.checkin(new ParkingSpace(id));
		assertEquals(21, id);
		System.out.println("Parking id: " + id);
		guestparkid = id;
		
		available = lot.getavailableguestspace();
		assertEquals(9, available);
		System.out.println("There are " + available + " numbers of Parking Space for guest left\n");
		System.out.println("---------------------------------------------------");
	}
	
}
