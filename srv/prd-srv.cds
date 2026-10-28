using {b83capm.db as db} from '../db/schema';

service PrdMgmtService {
    @odata.draft.enabled
    entity Product    as projection on db.Products
    {
        *,
        case 
        when stock = 0 then 'Out of Stock'
        when stock < 10  then 'less stock'
        else 'Available' end as Status : String(50),
        case
        when stock = 0 then 1
        when stock < 10 then 2
        else 3 end as criticality : Integer
    };
}
