const User = require('../models/users')
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const jwt = require('jsonwebtoken')



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
			const expiry = new Date()
			expiry.setDate(expiry.getDate() + 7)
			const userToken = jwt.sign({
			email: req.body.email,
			username: req.body.username,
			exp: parseInt(expiry.getTime()/1000, 10)
		}, process.env.JWT_SECRET)
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
			const expiry = new Date()
			expiry.setDate(expiry.getDate() + 7)
			return res.status(200).json({
				success: true,
				message: "User logged in successfully",
				token: jwt.sign({
					email: req.body.email,
					username: req.body.username,
					exp: parseInt(expiry.getTime()/1000, 10)
				}, process.env.JWT_SECRET)
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


// exports.editProfile = async (req, res)=>{
// 	try{
// 		var docfilePath   = req.file.path
// 		await cloudinary.uploader.upload(docfilePath, (err, result)=>{
//             if(!err){

// 				User.findOneAndUpdate({username: req.decoded.username}, {$set: {email: req.body.email, profileImage: result.url, fullName: req.body.profileImage}}, function (err){
// 					if(err) throw err
// 					res.status(200).json({ 
// 						success: true,
// 						message: 'Your Profile was successfully updated'
// 					})
					
// 				})
// 			}
// 			fs.unlink(docfilePath, function (err) {
//                 if (err) throw err;
//                 // if no error, file has been deleted successfully
//                 console.log('File deleted!');
//             })
//            })

// 	}catch(err){
// 		console.log(err)
// 	}
// }



exports.editProfile = async (req, res)=>{
	try{
		User.findOneAndUpdate({username: req.decoded.username}, {$set: {email: req.body.email,fullName: req.body.fullName, bio: req.body.bio}}, function (err){
			if(err) throw err
			res.status(200).json({ 
				success: true,
				message: 'Your Profile was successfully updated'
			})
			
		})
	}catch(err){

		res.send("error")
	}
}














