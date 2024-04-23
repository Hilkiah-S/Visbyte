import { BrowserRouter, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import SignUp from "./pages/SignUp";
import SignIn from "./pages/SignIn";
import Header from "./components/Header";
import AddQuestions from "./pages/AddQuestions";
import AddFile from "./pages/AddFile";

function App() {
  return (
    <>
      <BrowserRouter>
        <div className="px-5 md:px-20 lg:px-32">
          <Header />
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/login" element={<SignIn />} />
            <Route path="/register" element={<SignUp />} />
            <Route path="/add-question" element={<AddQuestions />} />
            <Route path="/add-file" element={<AddFile />} />
          </Routes>
        </div>
      </BrowserRouter>
    </>
  );
}

export default App;
