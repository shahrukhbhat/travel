using {travelSrv} from '../srv/service.cds';

annotate travelSrv.Travel with @UI.HeaderInfo: {
  TypeName      : 'Travel',
  TypeNamePlural: 'Travels'
};

annotate travelSrv.Travel with {
  destination @title: 'Destination';
  startDate   @title: 'Start Date';
  endDate     @title: 'End Date';
  totalPrice  @title: 'Total Price';
  status      @title: 'Status'
};

annotate travelSrv.Travel with {
  totalPrice @Measures.ISOCurrency: Currency_code
};

annotate travelSrv.Travel with @UI.LineItem: [
  {
    $Type: 'UI.DataField',
    Value: destination
  },
  {
    $Type: 'UI.DataField',
    Value: startDate
  },
  {
    $Type: 'UI.DataField',
    Value: endDate
  },
  {
    $Type: 'UI.DataField',
    Value: totalPrice
  },
  {
    $Type: 'UI.DataField',
    Value: status
  },
  // Accept action button in table header toolbar
  {
    $Type : 'UI.DataFieldForAction',
    Label : 'Accept',
    Action: 'travelSrv.Accept',
  },
  // Reject action button in table header toolbar
  {
    $Type : 'UI.DataFieldForAction',
    Label : 'Reject',
    Action: 'travelSrv.Reject',
  }
];

annotate travelSrv.Travel with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: destination
    },
    {
      $Type: 'UI.DataField',
      Value: startDate
    },
    {
      $Type: 'UI.DataField',
      Value: endDate
    },
    {
      $Type: 'UI.DataField',
      Value: totalPrice
    },
    {
      $Type: 'UI.DataField',
      Value: status
    }
  ]
};

annotate travelSrv.Travel with {
  bookings @Common.Label: 'Bookings'
};

annotate travelSrv.Travel with @UI.Facets: [
  {
    $Type : 'UI.ReferenceFacet',
    ID    : 'Main',
    Label : 'General Information',
    Target: '@UI.FieldGroup#Main'
  },
  {
    $Type : 'UI.ReferenceFacet',
    ID    : 'Booking',
    Target: 'bookings/@UI.LineItem'
  }
];

annotate travelSrv.User with @UI.HeaderInfo: {
  TypeName      : 'User',
  TypeNamePlural: 'Users',
  Title         : {Value: username}
};

annotate travelSrv.User with {
  ID  @UI.Hidden  @Common.Text: {
    $value                : username,
    ![@UI.TextArrangement]: #TextOnly
  }
};

annotate travelSrv.User with @UI.Identification: [{Value: username}];

annotate travelSrv.User with {
  username @title: 'Username';
  email    @title: 'Email'
};

annotate travelSrv.User with @UI.LineItem: [
  {
    $Type: 'UI.DataField',
    Value: username
  },
  {
    $Type: 'UI.DataField',
    Value: email
  }
];

annotate travelSrv.User with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: username
    },
    {
      $Type: 'UI.DataField',
      Value: email
    }
  ]
};

annotate travelSrv.User with {
  bookings @Common.Label: 'Bookings'
};

annotate travelSrv.User with @UI.Facets: [{
  $Type : 'UI.ReferenceFacet',
  ID    : 'Main',
  Label : 'General Information',
  Target: '@UI.FieldGroup#Main'
}];

annotate travelSrv.User with @UI.SelectionFields: [username];

annotate travelSrv.Booking with @UI.HeaderInfo: {
  TypeName      : 'Booking',
  TypeNamePlural: 'Bookings',
  Title         : {Value: bookingId}
};

annotate travelSrv.Booking with {
  ID  @UI.Hidden  @Common.Text: {
    $value                : bookingId,
    ![@UI.TextArrangement]: #TextOnly
  }
};

annotate travelSrv.Booking with @UI.Identification: [{Value: bookingId}];

annotate travelSrv.Booking with {
  travel @Common.ValueList: {
    CollectionPath: 'Travel',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: travel_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'destination'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPrice'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};

annotate travelSrv.Booking with {
  user @Common.ValueList: {
    CollectionPath: 'User',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: user_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'username'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
    ],
  }
};

annotate travelSrv.Booking with {
  bookingId @title: 'Booking ID';
  price     @title: 'Price'
};

annotate travelSrv.Booking with {
  price @Measures.ISOCurrency: Currency_code
};

annotate travelSrv.Booking with @UI.LineItem: [
  {
    $Type: 'UI.DataField',
    Value: bookingId
  },
  {
    $Type: 'UI.DataField',
    Value: price
  },
  {
    $Type: 'UI.DataField',
    Label: 'User',
    Value: user_ID
  }
];

annotate travelSrv.Booking with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: bookingId
    },
    {
      $Type: 'UI.DataField',
      Value: price
    },
    {
      $Type: 'UI.DataField',
      Label: 'User',
      Value: user_ID
    }
  ]
};

annotate travelSrv.Booking with {
  user @Common.Text: {
    $value                : user.username,
    ![@UI.TextArrangement]: #TextOnly
  }
};

annotate travelSrv.Booking with {
  travel @Common.Label: 'Travel';
  user   @Common.Label: 'User'
};

annotate travelSrv.Booking with @UI.Facets: [{
  $Type : 'UI.ReferenceFacet',
  ID    : 'Main',
  Label : 'General Information',
  Target: '@UI.FieldGroup#Main'
}];

annotate travelSrv.Booking with @UI.SelectionFields: [
  travel_ID,
  user_ID
];
