import mongoose from 'mongoose'
const QuestionsSchema = new mongoose.Schema(
    {
        code: {
            type: String,
        },
        question: {
            type: String,
        },
    
        choicea: {
            type: String,
        },
        choiceb: {
            type: String,
        },
        choicec: {
            type: String,
        },
        choiced: {
            type: String,
        },
        answers: {
            type: String,
        },
        timeall: {
            type: String,
        }
    }
)

const Questions = mongoose.model('Questions', QuestionsSchema);

export default Questions

