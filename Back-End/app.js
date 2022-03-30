const express=require('express');
const bodyParser= require('body-parser');
const session = require('express-session');
const mongoose= require('./database');
const port = 3000;
const app = express();
app.use(bodyParser.urlencoded({extended : true})) //for body-parser to return warning
app.use(bodyParser.json())
app.use('/uploads',express.static('uploads'));




const server =app.listen(port,()=>
console.log(`app is running on port ${port}`));


const postRoute = require('./components/Tweets/tweets');

app.use("/tweets", postRoute);


module.exports = server
