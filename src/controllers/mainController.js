const path = require("path");
const fs = require("fs");
const productsFilePath = path.join(__dirname, "../database/products.json");
const products = JSON.parse(fs.readFileSync(productsFilePath, "utf-8"));

const mainController = {
  index: (req, res) => {
    const ofertas = products.filter((x) => x.categoria === "oferta");
    const ultimas = products.filter((x) => x.categoria === "ultima");
    res.render("index", { ofertas, ultimas });
  },
};

module.exports = mainController;