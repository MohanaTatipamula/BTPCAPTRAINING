namespace b83capm.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Products : cuid, managed {
    // key ID : UUID;
    @mandatory
    @assert.format : '^[a-zA-Z]+$'
    @assert.format.message: 'Name can only contain letters and spaces'
    name        : String(50);
    description : String(50);
    @mandatory
    price       : Decimal(9, 2);
    @assert.range:[0,90]
    discount    : Integer;
    @mandatory
    stock       : Integer;

    @Core.MediaType: mediaType
    image       : LargeBinary;
    @Core.AcceptableMediaTypes: ['image/jpeg', 'image/png', 'image/gif']
    @assert.format.message : 'Upload only jpeg, png and gif format'
    mediaType :String;

}


entity Orders : cuid, managed {
    customerName   : String(30);
    customerMobile : String(10);
    storeName      : String(20);
    netPrice       : Decimal(9, 2);
    items          : Composition of many OrderItems
                         on items.order = $self
}

entity OrderItems : cuid, managed {
    order      : Association to Orders;
    product    : Association to Products;
    quantity   : Integer;
    unitPrice  : Decimal(9, 2);
    discount   : Integer;
    totalPrice : Decimal(9, 2);
}
