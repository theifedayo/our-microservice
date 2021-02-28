const User = require('../models/users')
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy



exports.register = (req, res)=>{
	if(!req.body.username || !req.body.email || !req.body.password){
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
			throw err
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
	try{
		await User.findOne({ username: req.params.username}, (err, result)=>{
			return res.status(200).json({
				username: req.params.username,
				data: result
			})
		})
	}catch{
		res.status(500).json({message: 'Server error'})
	}
}