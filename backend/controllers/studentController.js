import asyncHandler from "express-async-handler";
import generateToken from "../utils/generateToken.js";
import Student from '../models/studentModel.js'

// Login
const authStudent = asyncHandler(async (req, res) => {
  const { email, password } = req.body;
  const student = await Student.findOne({ email });

  if (student && (await student.matchPassword(password))) {
    generateToken(res, student._id);

    res.json({
      _id: student._id,
      name: student.full_name,
      email: student.email,
    });
  } else {
    res.status(401);
    throw new Error("Invalid email or password");
  }
});

// Register a new user

const registerStudent = asyncHandler(async (req, res) => {
  const { full_name, email, password } = req.body;

  console.log(full_name, email, password);


  const studentExists = await Student.findOne({ email });

  if (studentExists) {
    res.status(400);
    throw new Error("User already exists.");
  }

  const student = await Student.create({
    full_name,
    email, 
    password,
  })

  if (student){
    generateToken(res, student._id);

    res.status(201).json({
        _id: student._id,
        full_name: student.full_name,
        email: student.email,
    })
  } else {
    res.status(400)
    throw new Error('Invalid user data.')
  }
});

// Get user by Id

export { registerStudent, authStudent }
