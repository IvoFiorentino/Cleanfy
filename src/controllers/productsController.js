const path = require("path");
const productsFilePath = path.join(__dirname, "../data/products.json");
const fs = require("fs");
const { validationResult } = require("express-validator");
//const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));
const db = require("../database/models");
const models = require('../database/models/Product');
const producto = models.product;

const productsController = {
  productCart: (req, res) => res.render("carrito"),

  cargarItemCarrito(req, res) {
    var carrito = req.session.carrito;
    var external = req.params.product_id;
    producto.findOne({where: {product_id: external}, include: [{model: category, required: true}]})
            .then(producto => {
                if (producto) {
                    let pos = CarritoController.verificar(carrito, external);
                    if (pos == -1) {
                        let datos = {
                            id: vino.id,
                            nombre: vino.nombre,
                            cantidad: 1,
                            precio: vino.precio,
                            precio_total: vino.precio,                         
                        };
                        carrito.push(datos);
                    } else {
                        let data = carrito[pos];
                        data.cantidad = data.cantidad + 1;
                        data.precio_total = data.precio * data.cantidad;
                        carrito[pos] = data;
                    }
                    req.session.carrito = carrito;
                    console.log(req.session.carrito);
                    res.status(200).json(req.session.carrito);
                } else {
                    res.status(500).json('No se ha podido añadir al carrito de compras');
                }
            }).catch(err => {
        res.status(500).json(err);
    });
},


quitarItem(req, res) {
  let carrito = req.session.carrito;
  let external = req.params.external_id;
  let pos = productsController.verificar(carrito, external);
  let data = carrito[pos];
  if (data.cantidad > 1) {
      data.cantidad = data.cantidad - 1;
      data.precio_total = data.cantidad * data.precio;
      carrito[pos] = data;
      req.session.carrito = carrito;
      res.status(200).json(req.session.carrito);
  } else {
      let aux = [];            
      for(let i = 0; i < carrito.length; i++) {
          let items = carrito[i];
          if(items.external_id != external) {
              aux.push(items);
          }
      }
      req.session.carrito = aux;
      res.status(200).json(req.session.carrito);
  }
},

verificar(lista, external) {
  var pos = -1;
  for (var i = 0; i < lista.length; i++) {
      if (lista[i].external_id == external) {
          pos = i;
          break;
      }
  }
  return pos;
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
