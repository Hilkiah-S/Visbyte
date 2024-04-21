import express from "express";
import { addQuestionController, getQuestionController } from "../controllers/questionsController.js"

const router = express.Router();

router.post("/add-question", addQuestionController);
router.post("/get-question", getQuestionController);


export default router;