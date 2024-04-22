import Questions from "../models/questionsModel.js";

// Add questions
const addQuestionController = async (req, res) => {
  const { code, question, choicea, choiceb, choicec, choiced, answers, timeall } =
    req.body;

  if (
    !code ||
    !question ||
    !choicea ||
    !choiceb ||
    !choicec ||
    !choiced ||
    !answers || 
    !timeall
  ) {
    res.status(400).json({ message: "Bad request." });
  }

  try {
    const response = await Questions.create({
      code,
      question,
      choicea,
      choiceb,
      choicec,
      choiced,
      answers,
      timeall,
    });

    res.status(201).json({ message: "Question succesfully added." });
    console.log(response);
  } catch (error) {
    console.log(error);
  }
};

// Get questions
const getQuestionController = async (req, res) => {
  console.log(req.body.code);
  const questions = await Questions.find({ code: req.body.code });
  console.log(questions);

  try {
    const questions = await Questions.find({ code: req.body.code });
    // console.log(questions);
    if (!questions) {
      res.status(404).json({ message: "Questions not found." });
    }

    res.status(201).json({ message: "Success", data: questions });
    console.log(questions);
  } catch (error) {
    console.log(error);
  }
};

export { addQuestionController, getQuestionController };
