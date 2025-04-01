component accessors = "true"
{
    variables.mainComponent = new routes.main();
    variables.userComponent = new routes.user();
    variables.postcomponent = new routes.post();
    variables.bookingComponent = new routes.booking();

    /**
     * Function to get all defined routes from different route files.
     * @return array of all routes
     */
    
    function getRoutes()
    {
        var router = [];
        
        // Instantiate the 'routes.booking' component
        var mainRoutes = variables.mainComponent.initRoutes();
        var userRoutes = variables.userComponent.initRoutes();
        var postRoutes = variables.postcomponent.initRoutes();
        var bookingRoutes = variables.bookingComponent.initRoutes();
    
        // Append the routes to the router
        router.append(mainRoutes, true);
        router.append(userRoutes, true);
        router.append(postroutes, true);
        router.append(bookingRoutes, true);
        return router;
    }
    
}