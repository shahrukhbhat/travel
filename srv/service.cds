using { travel as my } from '../db/schema.cds';

@path : '/service/travel'
service travelSrv
{
    @odata.draft.enabled
    entity Travel as
        projection on my.Travel
        actions
        {
            action Accept
            (
            )
            returns Travel;

            action Reject
            (
            )
            returns Travel;
        };

    @odata.draft.enabled
    entity User as
        projection on my.User;

    entity Booking as
        projection on my.Booking;
}

annotate travelSrv with @requires :
[
    'authenticated-user'
];
