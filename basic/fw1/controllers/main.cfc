component accessors = "true"
{

    function init(any fw)
    {
        variables.fw = fw;
        return this;
    }

    function default(rc) {
        variables.fw.renderData().data({
            "message" = "Welcome to the API",
            "status" = 200
        }).type("json")
    }
    
    public void function missingView(event, rc)
    {
        variables.fw.renderData().type("json").data({"error" = "The requested resource could not be found.", "status" = 404});
    }
    
    function patch(struct rc, struct headers)
    {
        var response = {"method" = "PATCH", "multi" = rc.multi, "single" = rc.single};
        variables.fw.renderData().type('json').data(response);
    }
    
    function post(struct rc, struct headers)
    {
        var response = {"method" = "POST", "multi" = rc.multi, "single" = rc.single};
        variables.fw.renderData().type('json').data(response);
    }
    
    function put(struct rc, struct headers)
    {
        var response = {"method" = "PUT", "multi" = rc.multi, "single" = rc.single};
        variables.fw.renderData().type('json').data(response);
    }
    
}