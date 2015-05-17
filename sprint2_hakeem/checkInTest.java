package sprint2_hakeem;

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

public class checkInTest {
	
	// parking lot with 30 parking space
	public static void InitParkingSpace(ParkingLot lot){
		for (int i = 0; i <= 30; i++){
			ParkingSpace space = new ParkingSpace(i);
			lot.addParkingSpace(space);
		}
	}

	@Test
	public void test() {
		ParkingLot lot = new ParkingLot();
		InitParkingSpace(lot);
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
