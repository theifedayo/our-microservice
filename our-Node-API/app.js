const path = require('path')
const express = require('express')
const cors = require('cors')
const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const session = require('express-session')
const dotenv = require('dotenv')
const connectDB = require('./config/db')
const cloudinary = require('cloudinary').v2
const multer = require('multer')


dotenv.config({path: './config/config.env'})


connectDB()
const app = express()

//body parser
app.use(express.json())

//enable cors
app.use(cors())

//Handle express sessions
app.use(session({
	secret: process.env.SESSION_SECRET,
	saveUninitialized: true,
	resave: true
}))

//handle passport
app.use(passport.initialize())
app.use(passport.session())

app.use(express.static(path.join(__dirname, '/public/profileimages-quickdump')))
app.use('/uploads', express.static(__dirname + '/public/profileimages-quickdump/'))

var upload = multer({ dest: 'public/profileimages-quickdump/' })

app.post('*', (req, res, next)=>{
  res.locals.user = req.user || null
  next()
})

//configure cloudinary
cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.API_KEY,
  api_secret: process.env.API_SECRET
})

//Routes

app.use('/api/v1', require('./routes/users'))



// app.post('*', (req, res, next)=>{
//   res.locals.user = req.user || null
//   next()
// })

// app.put('*', (req, res, next)=>{
//   res.locals.user = req.user || null
//   next()
// })

// app.delete('*', (req, res, next)=>{
//   res.locals.user = req.user || null
//   next()
// })



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(unauthorizedError(401));
});

//Handle unauthorized error
app.use(function (err, req, res, next) {
  if (err.name === 'UnauthorizedError') {
    res.status(401).json({
    	"success": false,
    	"message" : err.name + ": " + err.message});
  }
});


const PORT = process.env.PORT || 5000

app.listen(PORT, ()=>{
	console.log(`Server running in ${process.env.NODE_ENV} mode on port ${process.env.PORT}`)
})