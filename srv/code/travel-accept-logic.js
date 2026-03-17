/**
 * 
 * @On(event = { "Accept" }, entity = "travelSrv.Travel")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function (request) {
	const { ID } = request.params[0];
    if (!ID) {
        return; // Exit if the travel ID is undefined
    }

    const { Travel } = cds.entities;

    // Update the status field for the travel entity where ID matches
    //await cds.run(UPDATE(Travel).set({ status: 'R' }).where({ ID: travelID }));
    await UPDATE(Travel).set({ status: 'A' }).where({ ID: ID });

    // Return the updated travel entity
    const updatedTravel = await SELECT.one.from(Travel).where({ ID: ID });
    return updatedTravel;
}