import express from "express";
const router = express.Router(); 
const documentController=require("../controllers/documentController");


router.post('/create',  documentController.createDoc); 

module.exports = router;