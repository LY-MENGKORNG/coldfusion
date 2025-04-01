/**
    Roles Table (Role-Based Access)
*/
component persistent = "true" accessors = "true" table = "roles" entityName = "Role"
{
    property name = "id" generator = "native" ormtype = "integer" fieldtype = "id" setter = "false";

    property name = "name" ormtype = "string" length = "50" unique = "true" notnull = "true";
    property name = "description" ormtype = "string" length = "255";
}