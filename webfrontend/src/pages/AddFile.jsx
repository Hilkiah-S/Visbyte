const AddFile = () => {
  return (
    <div className="flex flex-col gap-4 justify-center items-center h-screen mt-[-100px]">
        <p className="text-white text-2xl font-bold font-mono">Upload File</p>
      <div className="mt-2 flex justify-center rounded-lg border border-dashed border-gray-300/25 px-6 py-10 sm:w-[400px] lg:w-[700px] h-72">
        <div className="text-center">
          <div className="mt-4 flex text-sm leading-6 text-gray-600">
            <label
              htmlFor="file-upload"
              className="relative cursor-pointer rounded-md bg-gray-700 font-semibold text-gray-200 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500"
            >
              <span>Upload a file</span>
              <input
                id="file-upload"
                name="file-upload"
                type="file"
                className="sr-only"
              />
            </label>
            <p className="pl-1 text-gray-100">or drag and drop</p>
          </div>
          <p className="text-xs leading-5 text-gray-200">
            PNG, JPG, GIF up to 10MB
          </p>
        </div>
      </div>
      <p className="px-5 py-2 rounded bg-orange-500 text-white">Submit</p>
    </div>
  );
};

export default AddFile;
