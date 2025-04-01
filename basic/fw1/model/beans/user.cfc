/**
    The persistent attribute tells
    ColdFusion that we want this CFC to be mapped to a database.
    If you omit the persistent attribute then ColdFusion will treat User.
    cfc as a normal ColdFusion component.

*/
component persistent = "true" table = "users"
{

    /**
    I want the database to be responsible for creating primary keys, so I've added the
    generator attribute with a value of 'native'.
    */
    // Primary Key
    property name = "id" generator = "native" ormtype = "integer" fieldtype = "id" setter = "false";

    // User Information
    property name = "username" ormtype = "string" length = "50" unique = "true" notnull = "true";
    property name = "email" ormtype = "string" length = "255" unique = "true" notnull = "true";

    // Secure Password (use BCrypt, SHA-256 needs 64 chars)
    property name = "passwordHash" ormtype = "string" length = "255" notnull = "true";
    // If using traditional hashing
    property name = "passwordSalt" ormtype = "string" length = "255";

    // Role-based Access (FK to Roles table)
    property name = "roleId" ormtype = "integer" fieldtype = "many-to-one" cfc = "Role" fkcolumn = "roleId" notnull = "true";

    // Security Features
    property name = "failedLoginAttempts" ormtype = "integer" default = "0";
    property name = "lastLogin" ormtype = "timestamp";
    property name = "createdAt" ormtype = "timestamp" default = "CURRENT_TIMESTAMP";
    property name = "updatedAt" ormtype = "timestamp" default = "CURRENT_TIMESTAMP" onupdate = "CURRENT_TIMESTAMP";

    // Relationships (Example)
    property name = "sessions" fieldtype = "one-to-many" cfc = "Session" fkcolumn = "userId";
}