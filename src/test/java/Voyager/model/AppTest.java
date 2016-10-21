package Voyager.model;

import com.voyagerproject.dao.UserDAO;
import com.voyagerproject.exceptions.ResultNotFoundException;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple MainTestClass.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    /**
     * Simple test to try the entity managers
     */
    public void testApp()
    {
        UserDAO userDao = new UserDAO();
        try {
			assertNotNull(userDao.findById(5));
		} catch (ResultNotFoundException e) {
			assertNotNull(null);
		}
    }
}
