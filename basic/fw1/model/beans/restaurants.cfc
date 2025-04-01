component persistent = "true" accessors = "true" table = "restaurants" entityName = "Restaurant"
{
    property name = "id" generator = "native" ormtype = "integer" fieldtype = "id" setter = "false";

    property name = "name" ormtype = "string" length = "255";
    property name = "location" ormtype = "text";
    property name = "contact" ormtype = "text";
    property name = "opening_closing_time" ormtype = "string" length = "255";
    property name = "details" ormtype = "text";
    property name = "created" ormtype = "timestamp";
    property name = "edited" ormtype = "timestamp";

    // Relationships
    property name = "user" fieldType = "many-to-one" cfc = "User" fkcolumn = "userId";
}