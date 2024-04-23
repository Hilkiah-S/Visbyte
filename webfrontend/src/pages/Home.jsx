import { Button, Card } from "flowbite-react";
import { Link } from "react-router-dom";

const Home = () => {
  return (
    <div className="mt-[-100px]">
      <div className="py-10 sm:flex justify-center items-center h-screen gap-10">
        <Card className="max-w-sm bg-gray-800 border border-gray-700">
          <h5 className="text-2xl font-bold tracking-tight text-white">
            Exam Questions
          </h5>
          <p className="font-normal text-gray-300 dark:text-gray-400">
            Here are the biggest enterprise technology acquisitions of 2021 so
            far, in reverse chronological order.
          </p>
          <Link to={"/add-question"}>
            <Button className="bg-gradient-to-r from-orange-400 to-orange-600">
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
        <Card className="max-w-sm bg-gray-800 border border-gray-700">
          <h5 className="text-2xl font-bold tracking-tight text-white">
            Learning Resources
          </h5>
          <p className="font-normal text-gray-300 dark:text-gray-400">
            Here are the biggest enterprise technology acquisitions of 2021 so
            far, in reverse chronological order.
          </p>
          <Link to={"/add-file"}>
            <Button className="bg-gradient-to-r from-orange-400 to-orange-600">
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
