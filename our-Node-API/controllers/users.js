const User = require('../models/users')
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy



exports.register = (req, res)=>{
	if(!req.body.username || !req.body.email || !req.body.password){
		console.log(req.body)
		return res.status(400).json({
			success: false,
			message: "All fields are required"
		})
	}

	const newUser = new User()
	newUser.username = req.body.username
	newUser.email = req.body.email
	newUser.password = req.body.password

	User.createUser(newUser, (err, docs)=>{
		if(err){
			console.log(err.code)
		}else{
			const userToken = User.generateJWT()
			return res.status(200).json({
				success: true,
				message: "User created successfully",
				data: {
					username: newUser.username,
					email: newUser.email
				},
				token: userToken
			})
		}
	})
}


exports.checkUser = async(req, res)=>{
	
	await User.findOne({ username: req.params.username}, (err, result)=>{
		if(err) return res.status(500).json({msg: err})
		if(result !== null){
			return res.json({
				status: true
			})
		}else{
			return res.json({
				status: false
			})
		}
		
	})
	
}

exports.login = (req, res)=>{

	User.findOne({username:req.body.username}, function (err, user) {
      if (err) throw err
      if (!user) { 
      	return res.json({
      		status: false,
      		usernamemessage: "no user found"
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
				passwordmessage: 'Invalid Password'
			})
		}
	})
    });
	
	
}