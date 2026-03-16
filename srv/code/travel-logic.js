/**
 * 
 * @After(event = { "READ" }, entity = "travelSrv.Travel")
 * @param {(Object|Object[])} results - For the After phase only: the results of the event processing
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(results, request) {
  const { Booking } = cds.entities;

  if (!results) return;

  // Ensure results is an array
  if (!Array.isArray(results)) {
    results = [results];
  }

  for (const travel of results) {
    if (!travel.ID) continue;

    // Fetch all bookings related to the current travel
    const bookings = await SELECT.from(Booking).where({ travel_ID: travel.ID });

    // Calculate the total price from all bookings
    const totalPrice = bookings.reduce((sum, booking) => sum + (booking.price || 0), 0);

    // Update the totalPrice in the travel entity
    travel.totalPrice = totalPrice;
  }
}