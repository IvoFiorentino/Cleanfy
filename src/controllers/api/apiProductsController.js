const db = require('../../database/models');
const Op = db.Sequelize.Op;

module.exports = {
    list: (req, res) =>{
        db.Product.findAll({

        })
        .then(products => {
            db.Category.findAll()
            .then(category => {
                db.Image.findAll()
            })
        })
    }
}