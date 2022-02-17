const path = require("path");
const productsFilePath = path.join(__dirname, "../data/products.json");
const fs = require("fs");
const { validationResult } = require("express-validator");
//const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));
const db = require("../database/models");

const productsController = {
  productCart: (req, res) => res.render("carrito"),
  
  
  productCarrito: (req, res) =>{
    
  },





















  productDetail: (req, res) => res.render('productDetail'),

  products: (req, res) => {
    db.Product.findAll().then(function (products) {
      res.render("productList", { products: products });
    });
  },
  //  res.render('products', {products: products}),

  productCreate: function (req, res) {
    let promProduct_category = db.Product.findAll()

    Promise.all([promProduct_category])
      .then(([allProduct_category]) => {
        return res.render("productCreate", { allProduct_category });
      })
      .catch((error) => res.send(error));
  },

  newProduct: function (req, res) {

    db.Product.create({
      name: req.body.name,
      price: req.body.price,
      category: req.body.category,
      discount: req.body.descuento,
      image: req.file.filename
    })
      .then(() => {
        return res.redirect("/");
      })
      .catch((error) => res.send(error));
  },

  // productsDetail:(req, res) => {
  //   let productId = req.params.id;
  //   let product = Products.findByPk(productId)
  //   .then((product) => {
  //       return res.render("productDetail", { product });
  //   })
  //   .catch(error => res.send(error))
  // },

  productName: (req, res) => {
    let productId = req.params.id;
    db.Product.findByPk(productId)
    .then(producto => {
      res.render("productDetail", {producto})
    })
    .catch((error) => res.send(error));
  },

  editProduct: (req, res) => {
    let productId = req.params.id;
    db.Product.findByPk(productId)
    .then(product =>{
      res.render("productUpdate", {product})
    })
      .catch((error) => res.send(error));
  },

  updateProduct: function (req, res) {
    let productId = req.params.id;
    db.Product.update(
      {
        name: req.body.name,
        price: req.body.price,
        category: req.body.category,
        description: req.body.description,
        image: req.file?req.file.filename:'default.png',
      },
      {
        where: { id: productId },
      }
    )
      .then(() => {
        return res.redirect("/");
      })
      .catch((error) => res.send(error));
  },

  deleteProduct: function (req, res) {
    let productId = req.params.id;
    db.Product.destroy(
      { 
        where: { id: productId },
       force: true 
      }) // force: true es para asegurar que se ejecute la acción
      .then(() => {
        return res.redirect("/");
      })
      .catch((error) => res.send(error));
  },
};
module.exports = productsController;
