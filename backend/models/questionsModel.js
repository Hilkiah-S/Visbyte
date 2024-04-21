import mongoose from 'mongoose'
const QuestionsSchema = new mongoose.Schema(
    {
        code: {
            type: String,
        },
        question: {
            type: String,
        },
    
        choice_a: {
            type: String,
        },
        choice_b: {
            type: String,
        },
        choice_c: {
            type: String,
        },
        choice_d: {
            type: String,
        },
        answer: {
            type: String,
        }
    }
)

const Questions = mongoose.model('Questions', QuestionsSchema);

export default Questions

