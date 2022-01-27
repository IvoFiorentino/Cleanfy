const express = require("express");
const apiProductsController = require("../../controllers/api/apiProductsController");

const router = express.Router();

router.get("/", apiProductsController.index);

module.exports = router;
