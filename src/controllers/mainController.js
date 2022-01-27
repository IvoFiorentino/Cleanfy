const path = require("path");
const fs = require("fs");
const db = require('../database/models');
const Op = db.Sequelize.Op;
// const productsFilePath = path.join(__dirname, "../database/products.json");
// const products = JSON.parse(fs.readFileSync(productsFilePath, "utf-8"));

const mainController = {
  index: (req, res) => {
    res.send("llegue al main controler")
    const ofertas = products.filter((x) => x.categoria === "oferta");
    const ultimas = products.filter((x) => x.categoria === "ultima");
    res.render("index.ejs", { ofertas, ultimas });
  },
};

module.exports = mainController;