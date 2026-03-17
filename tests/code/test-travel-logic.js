/**
 * Given a running CAP service, the unit test should be able to get passed.
 *
 * @param {Function} GET The `axios` function to send a GET request
 * @param {Function} POST - The `axios` function to send a POST request
 * @param {Function} PATCH - The `axios` function to send a PATCH request
 * @param {Function} DELETE - The `axios` function to send a DELETE request
 * @param {Function} expect - The `chai` function to assert the response
 */
module.exports = async function (GET, POST, PATCH, DELETE, expect) {

('Travel Service Tests', () => {
    describe('Total Price Calculation', () => {
      let createdTravelID;
      const testBookings = [
        { bookingId: 'TEST-B001', price: 100.00, currency_code: 'EUR' },
        { bookingId: 'TEST-B002', price: 250.50, currency_code: 'EUR' },
        { bookingId: 'TEST-B003', price: 75.25, currency_code: 'EUR' }
 ];
      const expectedTotalPrice = testBookings.reduce((sum, b) => sum + b.price, 0);

      it('should create a Travel with bookings and calculate correct totalPrice', async () => {
        // Step 1: Create a draft Travel with nested bookings using deep insert
        const newTravel = {
          destination: 'Test Destination',
          startDate: '2024-06-01',
          endDate: '2024-06-15',
          currency_code: 'EUR',
          status: 'O',
          bookings: testBookings
        };

        const createResponse = await POST('/service/travel/Travel', newTravel);
        expect(createResponse.status).to.be.oneOf([200, 201]);
        createdTravelID = createResponse.data.ID;
        expect(createdTravelID).to.exist;

        // Step 2: Activate the draft Travel
        const activateResponse = await POST(`/service/travel/Travel(ID=${createdTravelID}, IsActiveEntity=false)/travelSrv.draft`);
        expect(activateResponse.status).to.be.oneOf([200, 201]);

        // Step 3: Retrieve the activated Travel and verify totalPrice
        const getResponse = await GET(`/service/travel/Travel(ID=${createdTravelID}, IsActiveEntity=true)`);
        expect(getResponse.status).to.equal(200);
        const travel = getResponse.data;
        expect(travel.totalPrice).to.equal(expectedTotalPrice);
      });
    });
  });
};