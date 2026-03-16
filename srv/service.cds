using { travel as my } from '../db/schema.cds';

@path: '/service/travel'
@requires: 'authenticated-user'
service travelSrv {
  @odata.draft.enabled
  entity Travel as projection on my.Travel;
  @odata.draft.enabled
  entity User as projection on my.User;
  entity Booking as projection on my.Booking;
}