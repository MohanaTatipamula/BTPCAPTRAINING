import cds from '@sap/cds'

export class OrderMgmtService extends cds.ApplicationService { init() {

  const { Orders, OrderItems, Products } = cds.entities('OrderMgmtService')

  this.before (['CREATE', 'UPDATE'], Orders, async (req) => {
    console.log('Before CREATE/UPDATE Orders', req.data)
  })
  this.after ('READ', Orders, async (orders, req) => {
    console.log('After READ Orders', orders)
  })
  this.before (['CREATE', 'UPDATE'], OrderItems, async (req) => {
    console.log('Before CREATE/UPDATE OrderItems', req.data)
  })
  this.after ('READ', OrderItems, async (orderItems, req) => {
    console.log('After READ OrderItems', orderItems)
  })
  this.before (['CREATE', 'UPDATE'], Products, async (req) => {
    console.log('Before CREATE/UPDATE Products', req.data)
  })
  this.after ('READ', Products, async (products, req) => {
    console.log('After READ Products', products)
  })


  return super.init()
}}
