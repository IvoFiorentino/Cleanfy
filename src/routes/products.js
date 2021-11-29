const express = require("express");
const path = require('path');
const multer = require('multer');
const router = express.Router();
const productsController = require("../controllers/productsController");

// Multer //
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './public/img/products');
  },
  filename: function (req, file, cb) {
    cb(null, `${file.fieldname}-${Date.now()}${path.extname(file.originalname)}`);
  }
})
var upload = multer({ storage: storage })

// Route System //
// 1. Listado de productos - /products (GET)
router.get("/", productsController.index);

// 2. Formulario de creación de productos - /products/create (GET)
router.get("/create", productsController.create);

// 4. Acción de creación (a donde se envía el formulario) - /products (POST)
router.post("/", upload.single('image'), productsController.store);

// 3. Detalle de un producto particular -  /products/:id (GET)
router.get("/:id", productsController.detail);

// 5. Formulario de edición de productos - /products/:id/edit (GET)
router.get("/:id/edit", productsController.edit);

// 6. Acción de edición (a donde se envía el formulario) - /products/:id (PUT)
router.put('/:id', upload.single('image'), productsController.update);

// 7. Acción de borrado - /products/:id (DELETE)
router.delete('/:id', productsController.destroy);

module.exports = router;
