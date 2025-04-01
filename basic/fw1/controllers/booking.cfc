component accessors = "true"
{

    function init(any fw)
    {
        variables.fw = fw;
        return this;
    }
    
    // POST /bookings/reservation/
    
    function createFromReservation(struct rc, struct headers)
    {
        var response = {"method" = "GET", "action" = "createFromReservation", "data" = rc};
        variables.fw.renderData().type('json').data(response);
    }
    
    // PUT /bookings/reservation/
    
    function updateFromReservation(struct rc, struct headers)
    {
        var response = {"method" = "PUT", "action" = "updateFromReservation", "data" = rc};
        variables.fw.renderData().type('json').data(response);
    }
    
    function getBooking(struct rc, struct headers)
    {
        var response = {"method" = "GET", "action" = "updateFromReservation", "data" = rc};
        variables.fw.renderData().type('json').data(response);
    }
    
}