namespace kaztakata;

entity Documents
{
    key ID : UUID;
    Name : String(100);
    Numbers: Int32;
    items : Composition of many Items on items.documents = $self;
}

entity Items
{
    key ID : UUID;
    Plant : String(100);
    Quantity : Integer;
    Amount : Decimal;
    Weigh : Double;
    documents : Association to one Documents;
}