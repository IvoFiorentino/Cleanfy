const express = require("express");
const path = require("path");
const morgan = require("morgan");
const methodOverride = require("method-override");
const multer = require('multer');
const upload = multer();
// const cookieParser = require('cookie-parser');

// Express //
const app = express();
const PORT = 3000;
const publicPath = path.join(__dirname, "../public");

// Template Engine //
app.set("view engine", "ejs");
app.set("views", "./src/views");

// Middleware //
app.use(express.static(publicPath));
app.use(morgan("dev"));
app.use(methodOverride("_method"));
app.use(express.urlencoded({ extended: false }));
//app.use(multer());
// app.use(express.json());
// app.use(cookieParser());

// Route System //
const mainRoute = require("./routes/main");
const usersRoute = require("./routes/users");
const productsRoute = require("./routes/products");

app.use("/", mainRoute);
app.use("/users", usersRoute);
app.use("/products", productsRoute);

app.listen(process.env.PORT || PORT, () => console.log("server up at: http://localhost:3000/"));