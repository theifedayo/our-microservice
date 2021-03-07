const user = require('../controllers/users')
const User = require('../models/users')
var express = require('express');
const middleware = require('../middlewares/middlewares')
var router = express.Router();
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy


/* GET users listing. */
router.post('/register', user.register)

router.get('/:username', user.checkUser)

router.post('/login', user.login)

router.post('/edit', middleware.checkToken, user.editProfile)






module.exports = router;