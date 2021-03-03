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


passport.serializeUser(function(user, done){
	done(null, user.id)
})

passport.deserializeUser(function(id, done){
	User.findById(id, function(err, user){
		done(err, user)
	})
})



//Local strategy
// passport.use(new LocalStrategy(
//   function(username, password, done) {
//     User.findOne({username:username}, function (err, user) {
//       if (err) { return done(err); }
//       if (!user) { 
//       	return done(null, false); 
//       }
//       console.log(err)
//       User.comparePassword(password, user.password, (err, isMatch)=>{
// 		if(err) throw err
// 		if(isMatch){
// 			return done(null, user)
// 		}else{
// 			return done(null, false, {message: 'Invalid Password'})
// 		}
// 	})
//     });
//   }
// ));



router.post('/login', function(req, res){ //, passport.authenticate('local')

	User.findOne({username:req.body.username}, function (err, user) {
      if (err) throw err
      if (!user) { 
      	return res.json({
      		status: false,
      		message: "no user found"
      	}); 
      }
      
      User.comparePassword(req.body.password, user.password, (err, isMatch)=>{
		if(err) throw err
		if(isMatch){
			return res.status(200).json({
				success: true,
				message: "User logged in successfully",
				token: User.generateJWT()
			})
		}else{
			return res.json({
				status: false,
				message: 'Invalid Password'
			})
		}
	})
    });
	
	
})

module.exports = router;