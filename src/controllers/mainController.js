const path = require("path");
const fs = require("fs");
const db = require('../database/models');
const Op = db.Sequelize.Op;
// const productsFilePath = path.join(__dirname, "../database/products.json");
// const products = JSON.parse(fs.readFileSync(productsFilePath, "utf-8"));

const mainController = {
  index : (req, res) =>{
    db.Product.findAll()
    .then((productos) => {
      res.render("index", {productos})}
    )
    .catch((err) => {
      res.send(err)
    });
}
}




module.exports = mainController;

