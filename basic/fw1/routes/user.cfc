
component accessors="true" {
    
    function initRoutes() {
        return [
            { "$POST/auth/login/$" = "/user/authenticate" },
            { "$POST/auth/register/$" = "/user/register" }
        ];
    };
}