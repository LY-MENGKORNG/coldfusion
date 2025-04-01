/**
    Sessions Table (Track User Sessions)
*/
component persistent = "true" accessors = "true" table = "sessions" entityName = "Session"
{
    property name = "id" generator = "native" ormtype = "integer" fieldtype = "id" setter = "false";

    property name = "userId" ormtype = "integer" fieldtype = "many-to-one" cfc = "User" fkcolumn = "userId" notnull = "true";
    property name = "sessionToken" ormtype = "string" length = "255" unique = "true" notnull = "true";
    property name = "ipAddress" ormtype = "string" length = "45";
    property name = "userAgent" ormtype = "string" length = "255";
    property name = "createdAt" ormtype = "timestamp" default = "CURRENT_TIMESTAMP";
    property name = "expiresAt" ormtype = "timestamp";
}