//IMPORT MODULES
const express = require('express');
const mongoose = require('mongoose');

//Local Import
const authRoutes = require('./routes/auth')

//INITILIZATION
const app = express()
const PORT = 3000;

app.use(express.json())
app.use(authRoutes);


const DB = 'mongodb+srv://joelmathew:amazon357@cluster0.s6vj2ic.mongodb.net/?retryWrites=true&w=majority'

mongoose.connect(DB).then(()=>{console.log("Connection success")}).catch(e=>{
    console.log(e)
})




app.listen(PORT,'0.0.0.0', ()=>console.log(`Server started at ${PORT}`))



