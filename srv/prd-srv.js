import cds from '@sap/cds'

export class PrdMgmtService extends cds.ApplicationService { init() {

  const { Product } = cds.entities('PrdMgmtService')

 // this.on ( 'CREATE', Product, async (req) => { console.log("I am inside my own create handler on Products");})
 //this.on ( 'CREATE', Product, async (req) => { console.log(req.data);
  
 //})
    // this.on ( 'CREATE', Product, async (req) => { await INSERT.into(Product).entries(req.data);})
    this.before('CREATE', Product, async (req) => { 
      if (req.data.discount === null ) {
        req.data.discount = 0 ;
        // req.reject(400,"Discount can't be empty");
      }
      
    })

    this.after ('READ',Product,async (results) => { 
       console.log(results);
      for (let i = 0; i < results.length; i++) {
        //Discount Calculation
        let discountPrice = results[i].price - (results[i].price * (results[i].discount/100));
        results[i].description = results[i].description + "(" + discountPrice + ")" ;
      }
    })

    


  return super.init()
}}
