component {
    this.name = "fw1";

    // any other application settings:
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 0, 30, 0);

    // Mapping framework and essential paths for FW/1 and application
    this.mappings["/framework"] = expandPath("./framework");
    this.mappings["/routes"] = expandPath("./routes");
    this.mappings["/root"] = getDirectoryFromPath(getCurrentTemplatePath());
    
    // datasource connected
    // this.datasources["fw1"] = {
    //     class: "org.postgresql.Driver", 
    //     bundleName: "org.postgresql.jdbc", 
    //     bundleVersion: "42.6.0",
    //     connectionString: "jdbc:postgresql://localhost:5432/fw1",
    //     username: "postgres",
    //     password: "encrypted:b4a6785d6274167471dd1d2e5d6b4edc06e822c16c756690",
        
    //     // optional settings
    //     connectionLimit:-1, // default:-1
    //     liveTimeout:15, // default: -1; unit: minutes
    //     timezone:'UTC',
    //     validate:false // default: false
    // };
    this.datasources["fw1"] = {
        class: "com.mysql.cj.jdbc.Driver", 
        bundleName: "com.mysql.cj", 
        bundleVersion: "8.0.33",
        connectionString: "jdbc:mysql://localhost:3306/fw1?characterEncoding=UTF-8&serverTimezone=Asia/Bangkok&maxReconnects=3",
        username: "root",
        password: "encrypted:cac9a55ae0516263d8a8c4bc27224c0c10123c8e2e7ca8ac",
        
        // optional settings
        connectionLimit:-1, // default:-1
        liveTimeout:15, // default: -1; unit: minutes
        alwaysSetTimeout:true, // default: false
        validate:false, // default: false
    };

    this.datasources = "fw1";

    // Enable ORM and configure settings
    this.ormEnabled = true;
    this.ormsettings = {
        cfclocation = "./model/beans",
        dbcreate = "dropcreate",
        dialect = "PostgreSQL",
        eventhandling = true,
        eventhandler = "root.model.beans.eventhandler",
        logsql = true,
        datasource = "fw1"
    };

    function _get_framework_one() {
        if (!structKeyExists(request, "_framework_one")) {
            var router = new routes.router();
            request._framework_one = new framework.one({
                decodeRequestBody = true,
                reloadApplicationOnEveryRequest = true,
                trace = true,
                missingview = "main.missingView",
                routes = router.getRoutes()
            });
        }
        return request._framework_one;
    }
    
    // Application lifecycle methods
    function onApplicationStart() {
        return _get_framework_one().onApplicationStart();
    }
    
    function onError(exception, event) {
        return _get_framework_one().onError(exception, event);
    }
    
    function onRequest(targetPath) {
        return _get_framework_one().onRequest(targetPath);
    }
    
    function onRequestEnd() {
        return _get_framework_one().onRequestEnd();
    }
    
    function onRequestStart(targetPath) {
        if(structKeyExists(url, "init")) {// Use index.cfm?init to reload ORM
            ormReload();// Reload ORM mappings
        }
        return _get_framework_one().onRequestStart(targetPath);
    }
    
    function onSessionStart() {
        return _get_framework_one().onSessionStart();
    }
}