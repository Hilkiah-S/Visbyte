const router = require("express-promise-router")(); 
const documentController=require("../controllers/documentController");

/** 
 *  
 *  
 * @route 
 * @group  
 * @returns {object} 200 - List confirmation for doc create
 * @returns {Error}  default - Unexpected error 
 */ 
router.get('/create',  documentController.createDoc); 

module.exports = router;