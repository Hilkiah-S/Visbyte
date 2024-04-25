import express from "express";
import { authStudent, registerStudent } from "../controllers/studentController.js";

const router = express.Router();

router.post("/", registerStudent);
router.post("/auth", authStudent)

export default router;
