component persistent = "true" table = "post"
{
    // identifier
    property name = "id" generator = "native" ormtype = "integer" fieldtype = "id" setter = "false";

    // properties
    property name = "title" length = "150";
    property name = "content" ormtype = "text";
    property name = "ispublished" ormtype = "boolean";
    property name = "datepublished" ormtype = "date";
    property name = "created" ormtype = "timestamp";
    property name = "updated" ormtype = "timestamp";
}