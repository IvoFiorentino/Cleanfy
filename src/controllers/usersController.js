const fs = require('fs');
const path = require('path');
// const usersFilePath  = path.join(__dirname,"../database/users.json");
// const users = JSON.parse(fs.readFileSync(usersFilePath, "utf-8"));
const User = require ('../database/models/User');

const { validationResult } = require('express-validator');
const bcrypt = require('bcryptjs/dist/bcrypt');

const usersController = {
  /////////////////////////////////////////////////////////////REGISTER//////////////////////////////////////////////////////////////////
  register: function(req, res) {
    return res.render('./users/register');
},
processRegister: (req, res) => {
  const resultValidation = validationResult(req);

  if (resultValidation.errors.length > 0) {
    return res.render('userRegisterForm', {
     errors: resultValidation.mapped(),
     oldData: req.body
   }); 
 }

  let userInDB = User.findByField('email', req.body.email);

  if(userInDB) {
    return res.render('userRegisterForm', {
      errors: {
        email: {
          msg: 'Este email ya está registrado'
        }
      },
      oldData: req.body
    });  
  }

  let userToCreate = {
    ...req.body,
    password: bcrypt.hashSync(req.body.password, 10),
    avatar: req.file.filename
  }
 
  User.create(req.body);
},
///////////////////////////////////////////////////FIN REGISTER/////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////LOGIN////////////////////////////////////////////////////////////////////////////////////////
login: function(req, res) {
    return res.render ('./users/login');
},
processLogin: function(req, res) {
 let errors = validationResult(req);
 if (errors.isEmpty ()) {
   let usersJSON = fs.readFileSync('users.json', {encoding: utf-8})
   let users;
   if (usersJSON == "") {
     users = [];
   }
   else{
     users = JSON.parse(usersJSON);
   }
   for(let i = 0; i < users.length; i++) {
     if (users[i].email == req.body.email ){
       if(bcrypt.compareSync(req.body.password, users[i].password)){
         let usuarioALoguearse = users[i];
         break;
       }
     }
   }
   if( usuarioALoguearse == undefined) {
     return res.render('login', {errors: [
       {msg: 'credenciales invalidas'}
     ]});
   }
  } else {
     return res.render ('login', {errors: errors.errors});
  }

  req.session.usuarioLogueado = usuarioALoguearse;
  res.render('index.ejs')

    if (req.body.recordame != undefined) {
      res.cookie('recordame', usuarioALoguearse.email, { maxAge: 60000 })
  }

},
store: function (req, res) {

    let ids = users.map(p => p.id)

    let newUser = {
         id: Math.max(...ids) + 1,
         ...req.body,
    };
    users.push(newUser)
     fs.writeFileSync(usersFilePath, JSON.stringify(users, null, ' '));
     res.redirect('/users');
},destroy: (req, res) => {
  let users = users.filter(product => product.id != req.params.id);
  fs.writeFileSync(usersFilePath, JSON.stringify(users, null, ' '));
  res.redirect('/');
}
}


module.exports = usersController;