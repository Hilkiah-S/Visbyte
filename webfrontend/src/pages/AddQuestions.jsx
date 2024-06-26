import { Button, Label, Radio, Textarea } from "flowbite-react";
import { useAddQuestionMutation } from "../slices/questionApiSlice";
import { useForm } from "react-hook-form";

const AddQuestion = () => {
  const {
    register,
    handleSubmit,
    formState: { isSubmitting },
    reset,
  } = useForm({});

  const [addQuestion] = useAddQuestionMutation();

  const onSubmit = async (data) => {
    console.log(data);
    try {
      const res = await addQuestion(data).unwrap();
      console.log(res);
      reset();
    } catch (err) {
      console.log(err);
      5;
    }
  };
  return (
    <div className="flex justify-center items-center my-10">
      <form
        className="flex sm:w-[700px] flex-col gap-4 border border-gray-700 p-10 rounded-md shadow-md bg-gray-950"
        onSubmit={handleSubmit(onSubmit)}
      >
        <div className="flex justify-between">
          <h2 className="text-3xl font-bold mb-5 font-mono text-gray-50">
            Add Question
          </h2>
          <div className="flex justify-center items-center gap-3">
            <p className="text-gray-50">Course code: </p>
            <input
              {...register("code")}
              className="bg-gray-900 border border-gray-700 text-gray-100 py-3 rounded-lg"
            />
          </div>
        </div>
        <div>
          <div className="mb-2 block">
            <Label
              htmlFor="question"
              value="Question*"
              className="text-gray-200"
            />
          </div>
          <Textarea
            id="question"
            type="text"
            placeholder="Question"
            shadow
            {...register("question")}
            className="bg-gray-900  border-gray-700 text-gray-100"
          />
        </div>
        <div>
          <div className="mb-2 block">
            <Label
              htmlFor="question"
              value="Choice A*"
              className="text-gray-200"
            />
          </div>
          <Textarea
            id="choicea"
            type="text"
            placeholder="Choice A"
            shadow
            {...register("choicea")}
            className="bg-gray-900 border-gray-700 text-gray-100"
          />
        </div>
        <div>
          <div className="mb-2 block">
            <Label
              htmlFor="question"
              value="Choice B*"
              className="text-gray-200"
            />
          </div>
          <Textarea
            id="choiceb"
            type="text"
            placeholder="Choice B"
            shadow
            {...register("choiceb")}
            className="bg-gray-900 border-gray-700 text-gray-100"
          />
        </div>

        <div>
          <div className="mb-2 block">
            <Label
              htmlFor="question"
              value="Choice C*"
              className="text-gray-200"
            />
          </div>
          <Textarea
            id="choicec"
            type="text"
            placeholder="Choice C"
            shadow
            {...register("choicec")}
            className="bg-gray-900 border-gray-700 text-gray-100"
          />
        </div>
        <div>
          <div className="mb-2 block">
            <Label
              htmlFor="question"
              value="Choice D*"
              className="text-gray-200"
            />
          </div>
          <Textarea
            id="choiced"
            type="text"
            placeholder="Choice D"
            shadow
            {...register("choiced")}
            className="bg-gray-900 border-gray-700 text-gray-100"
          />
        </div>

        <div className="flex gap-10">
          <div>
            <div className="mb-2 block">
              <Label
                htmlFor="duration"
                value="Duration*"
                className="text-gray-200"
              />
            </div>
            <input
              id="duration"
              type="text"
              placeholder="Duration"
              className="bg-gray-900 border border-gray-700 text-gray-100 py-3 rounded-lg"
              {...register("timeall")}
            />
          </div>

          <div>
            <div className="mb-2 block">
              <Label
                htmlFor="question"
                value="Answer*"
                className="text-gray-200"
              />
            </div>

            <fieldset className="flex max-w-md gap-4">
              <div className="flex items-center gap-2">
                <Radio
                  id="choice1"
                  name="question"
                  value="1"
                  {...register("answers")}
                />
                <Label className="text-gray-50" >
                  A
                </Label>
              </div>
              <div className="flex items-center gap-2">
                <Radio
                  id="choice2"
                  name="question"
                  value="2"
                  {...register("answers")}
                />
                <Label className="text-gray-50">
                  B
                </Label>
              </div>
              <div className="flex items-center gap-2">
                <Radio
                  id="choice3"
                  name="question"
                  value="3"
                  {...register("answers")}
                />
                <Label className="text-gray-50" >
                  C
                </Label>
              </div>
              <div className="flex items-center gap-2">
                <Radio
                  id="choice4"
                  name="question"
                  value="4"
                  {...register("answers")}
                />
                <Label className="text-gray-50">
                  D
                </Label>
              </div>
            </fieldset>
          </div>
        </div>

        <Button
          className="bg-gray-950 border-gray-700 rounded-lg hover:bg-gray-800"
          type="submit"
          disabled={isSubmitting}
        >
          Add Question
        </Button>
      </form>
    </div>
  );
};

export default AddQuestion;
