import path from "path";
import express from "express";
import dotenv from "dotenv";
import cors from 'cors'
import cookieParser from "cookie-parser";
import connectDB from "./config/db.js";
dotenv.config();
import { notFound, errorHandler } from "./middleware/errorMiddleware.js";
import userRoutes from "./routes/userRoutes.js";
import multer from 'multer';
import Pdf from 'pdf-parse';
import { promises as fs } from 'fs';


async function readFile() {
    try {
        const filePath = path.join(path.resolve(), 'test', 'data', '05-versions-space.pdf');
        const data = await fs.readFile(filePath, 'utf8');
        console.log(data);
    } catch (error) {
        console.error('Error reading the file:', error);
    }
}

readFile();


const fileStorage = multer.memoryStorage();
const upload = multer({ storage: fileStorage });
const port = process.env.PORT || 5000;

connectDB();

const app = express();
app.use(cors({origin:"http://localhost:3000", credentials:true}))
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(cookieParser());

app.use("/api/users", userRoutes);

app.get("/", (req, res) => {
  res.send("API is running....");
});
app.post('/pdf2text', upload.single('pdfFile'), (req, res) => {
  if (!req.file) {
      return res.status(400).send('No file uploaded.');
  }

  Pdf(req.file.buffer).then(function(data) {
      res.send({ text: data.text });
  }).catch(err => {
      console.error(err);
      res.status(500).send('Failed to extract text from PDF');
  });
});
app.use(notFound);
app.use(errorHandler);

app.listen(port, () => console.log(`Server started on port ${port}`));