package Test;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ mapunittesting.class, ParkingTest.class, RegisterTest.class,
		TestGuestAll.class })
public class AllTests {

}
