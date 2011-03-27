import grails.test.*

class VeggieUserTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testToString() {
        def veggieUser = new VeggieUser(fullName: 'Arnold Rimmer',
                                        userName: 'IronBalls',
                                        email: 'arnie@jmc.com',
                                        password: '1234',
                                        aboutMe:'',
                                        website:'',
                                        postcode:'')
        assertEquals 'IronBalls', veggieUser.toString()
    }
}
