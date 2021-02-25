const user = require('../controllers/users')
const User = require('../models/users')
var express = require('express');
var router = express.Router();
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy


/* GET users listing. */
router.post('/register', user.register)


module.exports = router;