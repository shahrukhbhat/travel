namespace travel;
using { cuid, Currency } from '@sap/cds/common';

entity Travel : cuid {
  destination: String(100);
  startDate: Date;
  endDate: Date;
  totalPrice: Decimal(10,2);
  Currency: Currency;
  status: String(1);
  bookings: Composition of many Booking on bookings.travel = $self;
}

@assert.unique: { username: [username] }
entity User : cuid {
  username: String(50) @mandatory;
  email: String(100);
  bookings: Association to many Booking on bookings.user = $self;
}

@assert.unique: { bookingId: [bookingId] }
entity Booking : cuid {
  bookingId: String(50) @mandatory;
  price: Decimal(10,2);
  Currency: Currency;
  travel: Association to Travel;
  user: Association to User;
}

