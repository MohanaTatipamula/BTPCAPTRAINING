using PrdMgmtService as service from '../../srv/prd-srv';

annotate service.Product with @(
    UI.SelectionFields               : [
        ID,
        name,
        price,
    ],
    UI.LineItem                      :{ 
        $value : [
        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: stock,
            Label: 'Stock',
        },
        {
            $Type: 'UI.DataField',
            Value: price,
        },
        {
            $Type: 'UI.DataField',
            Value: discount,
            Label: 'Discount',
        },
        {
            $Type: 'UI.DataField',
            Value: Status,
            Label: 'Status',
            Criticality : criticality,
        }
    ],
    @UI.Criticality : criticality
     },
    UI.HeaderInfo                    : {
        TypeName      : 'Product',
        TypeNamePlural: 'Products',
        Title         : {
            $Type: 'UI.DataField',
            Value: name,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description,
        },
        TypeImageUrl  : 'sap-icon://product',
        ImageUrl      : image,
    },
    UI.DataPoint #ID                 : {
        $Type: 'UI.DataPointType',
        Value: ID,
        Title: 'Product ID',
    },
    UI.DataPoint #price              : {
        $Type: 'UI.DataPointType',
        Value: price,
        Title: 'Product Price',
    },
    UI.DataPoint #status              : {
        $Type: 'UI.DataPointType',
        Value: Status,
        Title: 'Status',
        Criticality : criticality,
    },
    UI.HeaderFacets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ID',
            Target: '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'price',
            Target: '@UI.DataPoint#price',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'stock',
            Target: '@UI.DataPoint#status'
        }
    ],
    UI.Facets                        : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Information',
            ID    : 'ProductInformation',
            Target: '@UI.FieldGroup#ProductInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Image',
            ID    : 'ProductImage',
            Target: '@UI.FieldGroup#ProductImage',
        },
    ],
    UI.FieldGroup #ProductInformation: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            // Label: 'description',
            },
            {
                $Type: 'UI.DataField',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Value: discount,
            // Label: 'discount',
            },
            {
                $Type: 'UI.DataField',
                Value: stock,
            //Label: 'stock',
            },
        ],
    },
    UI.FieldGroup #ProductImage      : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: image,
            Label: 'image',
        }, ],
    },

);

annotate service.Product with {
    ID          @Common.Label: 'Product ID';
    name        @Common.Label: 'Product Name';
    price       @Common.Label: 'Price';
    discount    @Common.Label: 'Discount';
    description @Common.Label: 'Description';
    stock       @Common.Label: 'Stock'
};
