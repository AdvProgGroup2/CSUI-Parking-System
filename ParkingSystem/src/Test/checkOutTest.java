package Test;

/**
 * 
 * @author hakeem
 *
 * When guest check out, the parking space available must be increased.
 * 
 */

import static org.junit.Assert.*;

import org.junit.Test;
import Parking.ParkingLot;
import Parking.MainProgram;
import Parking.ParkingSpace;

public class checkOutTest {

	@Test
	public void test() {
		ParkingLot lot = new ParkingLot();
		MainProgram.InitParkingSpace(lot);
		int guestparkid = 0;
		
		
		int id=0;
		if (guestparkid==0) {
			id = 21;
		} else {
			id = guestparkid+1;
		}
		
		// check in to id 21
		lot.checkin(new ParkingSpace(id));
		assertEquals(21, id);
		guestparkid = id;
		
		// space available decreased by 1
		int available = lot.getavailableguestspace();
		assertEquals(9, available);
		System.out.println("There are " + available + " numbers of Parking Space for guest left\n");
		
		// check out from id 21
		lot.checkout(new ParkingSpace(guestparkid));
		guestparkid -= 1;
		
		// space available increased by 1
		available = lot.getavailableguestspace();
		assertEquals(10, available);
		System.out.println("There are " + available + " numbers of Parking Space for guest left\n");
		System.out.println("---------------------------------------------------");
		
	}

}
