const express = require('express');
const multer = require('multer');
const router = express.Router();
const app = express();

const {body, validationResult} = require('express-validator');

const path = require('path');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, '../public/img/avatar'); //Vincular imagen de avatar//
    },
    filename: (req, file, cb) => {
        let filename = `${file.fieldname}-${Date.now()}${path.extname(file.originalname)}`;
        cb(null, filename);
    }
})

const uploadFile = multer({ storage });

const usersController = require('../controllers/usersController');

const validaciones = [
    body('nombre').notEmpty().withMessage('Debes escribir un nombre'),
    body('apellido').notEmpty().withMessage('Debes escribir un apellido'),
    body('contraseña').notEmpty().withMessage('Debes escribir una contraseña'),
    body('confirmarContraseña').notEmpty().withMessage('La contraseñas deben coincidir'),
    body('email').notEmpty().withMessage('Debes escribir un correo electrónico').bail().isEmail().withMessage('Debes escribir un formato de correo válido'),
    body('avatar').custom((value, { req }) => {
        let file = req.file;
        let extensions = ['.jpg', '.png'];
        if (!file) {
            throw new Error('Tienes que subir una imagen');
        }else {
            let fileExtension = path.extname(file.originalname)
            if (extensions.includes(fileExtension)) {
                throw new Error('Las extensiones aceptadas son ${extensions.join(', ')}');
            }
        }
        return true;
    })
]

app.post('/register', [
    body('nya', 'Ingrese un nombre y apellido completo')
        .exists()
        .isLength({min:5}),
    body('email', 'Ingrese un E-mail válido')
        .exists()
        .isEmail(),
    body('edad', 'Ingrese un valor numérico')        
        .exists()
        .isNumeric()
], (req, res)=>{ 
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
        console.log(req.body)
        const valores = req.body
        const validaciones = errors.array()
        res.render('index', {validaciones:validaciones, valores: valores})
    }else{
        res.send('¡Validación Exitosa!')
    };
});



//RUTAS///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

router.get('/login', usersController.login);

router.get('/register', usersController.register);

//router.post('/register',uploadFile.single('avatar'), validaciones, usersController.registerprocess);

router.post('/login', usersController.processLogin);

router.post('/register',uploadFile.single('avatar'), validaciones, usersController.processRegister);

module.exports = router;