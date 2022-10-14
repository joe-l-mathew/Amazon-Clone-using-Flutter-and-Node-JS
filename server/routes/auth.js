const express = require('express');
const User = require('../model/user');

const authRoutes = express.Router()

authRoutes.post("/api/signup",async (req, res)=>{
    console.log(req.body)
    try{
    const {name, email,password } = req.body;
    console.log(email)
    let existingUser =await  User.findOne({email:email})
    if(existingUser){
        console.log(existingUser);
        return res.status(400).json({
            message:"email id already in use"
        })
    }
    let user = User({name, email, password});
    user = await user.save()
    res.status(200).json(user)

    }catch(e){
        res.status(500).json({
            error:e.message
        })
    }
}
)

module.exports= authRoutes