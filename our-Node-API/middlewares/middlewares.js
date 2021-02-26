const jwt = require('jsonwebtoken')
const dotenv = require('dotenv')



dotenv.config({path: '../config/config.env'})



exports.checkToken = (req, res, next)=>{
	let token = req.headers['authorization'];
	
	if(token){
		token = token.slice(7, token.length)
		jwt.verify(token, process.env.JWT_SECRET, (err, decoded)=>{
			if(err){
				return  res.json({
					status: false,
					message: "token is invalid"
				})
			}else{
				req.decoded = decoded
				next()
			}
			
		})
	}else{
		res.json({
			status: false,
			messsage: "token is not provided"
		})
	}
	
}