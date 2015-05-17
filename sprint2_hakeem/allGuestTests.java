package sprint2_hakeem;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ checkInTest.class, checkOutTest.class, idTest.class,
		noAvailableSpaceTest.class })
public class allGuestTests {

}
