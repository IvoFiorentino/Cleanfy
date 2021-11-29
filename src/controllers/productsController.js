const path = require("path");
const fs = require("fs");
const productsFilePath = path.join(__dirname, "../database/products.json");
const products = JSON.parse(fs.readFileSync(productsFilePath, "utf-8"));

const productsController = {
  // List View //
  index: (req, res) => {
    res.render("./products/productList", { products });
  },
  // Create View //
  create: (req, res) => {
    res.render("./products/productCreate")
  },
  // Store Method //
  store: (req, res) => {
    let image;
		if(req.file != undefined){
			image = req.file.filename
		} else {
			image = 'default-image.png'
		};
    let body = req.body;
    console.log(req.file);
    const productoMasAlto = products.sort((a, b) => a.id - b.id);
    const idMasAlto = productoMasAlto[productoMasAlto.length - 1].id;
    const nuevo = {
      ...body,
      id: idMasAlto + 1,
      image: image
    };
    products.push(nuevo);
    fs.writeFileSync(productsFilePath, JSON.stringify(products, null, " "));
    res.redirect("/");
  },
  // Detail View //
  detail: (req, res) => {
    const id = req.params.id;
    const producto = products.find((x) => x.id == id);
    if (producto) res.render("./products/productDetail", { producto });
    else res.redirect("/");
  },
  // Update View //
  edit:(req, res) =>{
    const product = products.find(product => product.id == req.params.id);
    res.render('./products/productUpdate', {product})
  },
  // Update Method //
  update: (req, res) => {
		let id = req.params.id;
		let productToEdit = products.find(product => product.id == id)
		let image
		if(req.file != undefined){
			image = req.file.filename
		} else {
			image = productToEdit.image
		}

		productToEdit = {
			id: productToEdit.id,
			...req.body,
			image: image,
		};
		let newProducts = products.map(product => {
			if (product.id == productToEdit.id) {
				return product = {...productToEdit};
			}
			return product;
		})

		fs.writeFileSync(productsFilePath, JSON.stringify(newProducts, null, ' '));
		res.redirect('/');
  },
  // Destroy Method //
  destroy: (req, res) => {
		let products = products.filter(product => product.id != req.params.id);
		fs.writeFileSync(productsFilePath, JSON.stringify(products, null, ' '));
		res.redirect('/');
  }
};

module.exports = productsController;
