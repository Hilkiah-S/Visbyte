import DocumentSchema from "../models/documentModel.js";

async function createDoc(doctitle,address){

    const docresponse=DocumentSchema.create({
        DocumentTitle:doctitle,address
    });


} 