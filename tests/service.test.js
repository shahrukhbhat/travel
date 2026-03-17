const test_travel_logic = require('./code/test-travel-logic');
const cds = require('@sap/cds/lib');
const {
  GET,
  POST,
  PATCH,
  DELETE,
  expect
} = cds.test(__dirname + '../../', '--with-mocks');
cds.env.requires.auth = {
  kind: "dummy"
};
describe('Service Testing', () => {
  it('test travel-logic', async () => {
    await test_travel_logic(GET, POST, PATCH, DELETE, expect);
  });
});