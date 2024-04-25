import { Button, Card } from "flowbite-react";
import { Link } from "react-router-dom";

const Home = () => {
  return (
    <div className="flex justify-center items-center">
      <div className="py-10 grid md:grid-cols-2 justify-center items-center gap-10 min-h-[500px]">
        <Card className="max-w-sm bg-gray-950 border border-gray-700 shadow shadow-gray-700">
          <h5 className="text-xl font-semibold tracking-tight text-white">
            Add Exam Questions
          </h5>
          <p className="font-normal text-gray-400 dark:text-gray-400 text-sm">
            Build your assessments with customized questions.
          </p>
          <Link to={"/add-question"} className="flex items-center">
            <Button className="border-gray-500 border bg-gray-950 text-gray-50 shadow shadow-gray-700 flex items-center ">
              Get started
              <svg
                className="-mr-1 ml-2 h-4 w-4"
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fillRule="evenodd"
                  d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                  clipRule="evenodd"
                />
              </svg>
            </Button>
          </Link>
        </Card>
        <Card className="max-w-sm bg-gray-950 border border-gray-700 shadow shadow-gray-700">
          <h5 className="text-xl font-semibold tracking-tight text-white">
            View Questions
          </h5>
          <p className="font-normal text-gray-400 dark:text-gray-400 text-sm">
            Show existing questions relevant to your subject.
          </p>
          <Link to={"/view-questions"}>
            <Button className="border-gray-500 border bg-gray-950 text-gray-50 shadow shadow-gray-700 flex items-center">
              Get started
              <svg
                className="-mr-1 ml-2 h-4 w-4 "
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fillRule="evenodd"
                  d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                  clipRule="evenodd"
                />
              </svg>
            </Button>
          </Link>
        </Card>
        <Card className="max-w-sm bg-gray-950 border border-gray-700 shadow shadow-gray-700">
          <h5 className="text-xl font-semibold tracking-tight text-white">
            Add Learning Resources
          </h5>
          <p className="font-normal text-gray-400 dark:text-gray-400 text-sm">
            Add resources like files or links for student learning.
          </p>
          <Link to={"/add-file"}>
            <Button className="border-gray-500 border bg-gray-950 text-gray-50 shadow shadow-gray-700 flex items-center">
              Get started
              <svg
                className="-mr-1 ml-2 h-4 w-4 "
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fillRule="evenodd"
                  d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                  clipRule="evenodd"
                />
              </svg>
            </Button>
          </Link>
        </Card>
        <Card className="max-w-sm bg-gray-950 border border-gray-700 shadow shadow-gray-700">
          <h5 className="text-xl font-semibold tracking-tight text-white">
            View Student Results
          </h5>
          <p className="font-normal text-gray-400 dark:text-gray-400 text-sm">
            Track and analyze student&apos; progress.
          </p>
          <Link to={"/view-result"}>
            <Button className="border-gray-500 border bg-gray-950 text-gray-50 shadow shadow-gray-700 flex items-center">
              Get started
              <svg
                className="-mr-1 ml-2 h-4 w-4 "
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fillRule="evenodd"
                  d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                  clipRule="evenodd"
                />
              </svg>
            </Button>
          </Link>
        </Card>
      </div>
    </div>
  );
};

export default Home;
