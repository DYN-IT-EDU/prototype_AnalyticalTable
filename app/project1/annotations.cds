using UserService as service from '../../srv/user-service';
using from '../../db/schema';

// Analytical Table Configurations
annotate service.Items with @(
    Aggregation.ApplySupported: { 
        GroupableProperties: [
            Plant
        ]
    },
    Aggregation.CustomAggregate #Quantity: 'Edm.Int32',
    Aggregation.CustomAggregate #Amount: 'Edm.Decimal',
    Aggregation.CustomAggregate #Weigh: 'Edm.Double',
){
    Quantity @Analytics.Measure @Aggregation.default: #SUM;
    Amount @Analytics.Measure @Aggregation.default: #SUM;
    Weigh @Analytics.Measure @Aggregation.default: #SUM;
}

annotate service.Documents with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
    ]
);
annotate service.Documents with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items',
            ID : 'Items',
            Target : 'items/@UI.LineItem#Items',
        },
    ]
);
annotate service.Items with @(
    UI.LineItem #Items : [
        {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : 'Plant',
        },{
            $Type : 'UI.DataField',
            Value : Quantity,
            Label : 'Quantity',
        },{
            $Type : 'UI.DataField',
            Value : Amount,
            Label : 'Amount',
        },{
            $Type : 'UI.DataField',
            Value : Weigh,
            Label : 'Weigh',
        },]
);
