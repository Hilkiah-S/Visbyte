import { useForm } from "react-hook-form";
import { useViewQuestionMutation } from "../slices/questionApiSlice";
import { useState } from "react";

export default function ViewQuestions() {
  const [questions, setQuestions] = useState([]);

  const {
    register,
    handleSubmit,
    formState: { isSubmitting },
    reset,
  } = useForm({});

  const [viewQuestions] = useViewQuestionMutation();

  const onSubmit = async (data) => {
    console.log(data);
    try {
      const res = await viewQuestions(data).unwrap();
      console.log(res.data);
      setQuestions(res.data);

      reset();
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div className="flex justify-center ">
      <form
        className="w-[700px] bg-gray-950 text-gray-200 my-20 border-gray-800 border p-10 rounded-3xl"
        onSubmit={handleSubmit(onSubmit)}
      >
        <div className="mb-4 flex items-center justify-between">
          <h5 className="text-xl font-bold leading-none text-gray-200">
            Questions
          </h5>
          <div className="space-x-4 ">
            <input
              type="text"
              placeholder="Course code"
              className="p-2 rounded-md bg-gray-800 border-gray-700"
              {...register("code")}
            />
            <button
              className="px-3 py-2 rounded-md bg-orange-400"
              disabled={isSubmitting}
            >
              {isSubmitting? "Loading..." : "Submit"}
            </button>
          </div>
        </div>
        {questions.length !== 0 ? (
          <div className="space-y-5">
            {questions.map((question) => (
              <div
                key={question._id}
                className="flow-root border p-5 border-gray-700  rounded-md space-y-5"
              >
                <ul className="divide-y divide-gray-700 dark:divide-gray-700">
                  <li className="py-3 sm:py-4">
                    <div className="flex items-center space-x-4">
                      <div className="shrink-0">
                        <p className="max-w-[500px]">* {question.question}</p>
                      </div>
                    </div>
                  </li>
                  <li className="py-3 sm:py-4">
                    <div className="flex items-center space-x-4">
                      <div className="min-w-0 flex-1">
                        <p className="truncate text-sm font-medium dark:text-gray-200">
                          A. {question.choicea}
                        </p>
                      </div>
                    </div>
                  </li>
                  <li className="py-3 sm:py-4">
                    <div className="flex items-center space-x-4">
                      <div className="min-w-0 flex-1">
                        <p className="truncate text-sm font-medium dark:text-gray-200">
                          B. {question.choiceb}
                        </p>
                      </div>
                    </div>
                  </li>
                  <li className="py-3 sm:py-4">
                    <div className="flex items-center space-x-4">
                      <div className="min-w-0 flex-1">
                        <p className="truncate text-sm font-medium dark:text-gray-200">
                          C. {question.choicec}
                        </p>
                      </div>
                    </div>
                  </li>
                  <li className="py-3 sm:py-4">
                    <div className="flex items-center space-x-4">
                      <div className="min-w-0 flex-1">
                        <p className="truncate text-sm font-medium dark:text-gray-200">
                          D. {question.choiced}
                        </p>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            ))}
          </div>
        ) : (
          <div className="mt-10 text-sm flex justify-center text-gray-400">
            Course code required to show existing questions.
          </div>
        )}
      </form>
    </div>
  );
}
