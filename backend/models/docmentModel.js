const mongoose=require('mongoose')

const DocumentSchema=new mongoose.Schema({
    documentTitle: { type: String, required: true },  
    address: { type: String, required: true, unique: true },  
    

    
},{
    timestamps:{createdAt:'created_at',modifiedAt:'modified_at'}
}

)

module.exports=mongoose.model('document',DocumentSchema);