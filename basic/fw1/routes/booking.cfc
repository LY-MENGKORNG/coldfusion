
component accessors="true" {
    
    function initRoutes() {
        return [
            { "$POST/api/booking/$" = "/booking/createFromReservation" },
            { "$PUT/api/booking/$" = "/booking/updateFromReservation" },
            { "$GET/api/booking/$" = "/booking/getBooking" }
        ];
    };
}