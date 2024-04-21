import DocumentSchema from "../models/documentModel.js";

async function createDoc(doctitle,address){

    const docresponse=DocumentSchema.create({
        DocumentTitle:doctitle,address
    });

    if(!docresponse){
        return false;
    }
    return docresponse;



} 


module.exports={createDoc};