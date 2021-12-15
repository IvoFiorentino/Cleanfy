const fs = require('fs');
const path = require('path');
const usersFilePath  = path.join(__dirname,"../database/users.json");
const users = JSON.parse(fs.readFileSync(usersFilePath, "utf-8"));

const { validationResult } = require('express-validator');

const usersController = {
  register: function(req, res) {
    return res.render('./users/register');
},
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
  
  registerprocess: (req, res) => {
    let resultValidation = validationResult(req);
    
    if (resultValidation.errors.length > 0) {
      return res.render('register', {
        errors: resultValidation.mapped()
      });
    }
  },
  //borrar usuario//
  // delete: (req, res) => {},////////////////////////////////////////////////
    store: function (req, res) {

        let ids = users.map(p => p.id)

        let newUser = {
            id: Math.max(...ids) + 1,
            ...req.body,
        };
        users.push(newUser)
        fs.writeFileSync(usersFilePath, JSON.stringify(users, null, ' '));
        res.redirect('/users');
},
destroy: (req, res) => {
  let users = users.filter(product => product.id != req.params.id);
  fs.writeFileSync(usersFilePath, JSON.stringify(users, null, ' '));
  res.redirect('/');
}
}


module.exports = usersController;