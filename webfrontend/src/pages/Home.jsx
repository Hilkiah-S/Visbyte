const Home = () => {
  return (
    <div className="w-full flex pt-8 space-x-16 bg-gray-50">
      <div className="flex flex-col sm:w-[65%]">
        <h1 className="text-gray-600 text-xl font-bold md:mb-2 mb-1 md:text-2xl">
          Lorem ipsum dolor sit amet.
        </h1>
        <div className="flex mb-2 text-sm font-semibold text-gray-500 items-center justify-between md:mb-4">
          <p className="font-mono">@username</p>
          <div className="flex space-x-2 text-xs font-mono">
            <p>41 resources here</p>
          </div>
        </div>
        <p className="text-md text-gray-700">
          Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facilis
          consequuntur temporibus maxime impedit accusamus? Sequi, perferendis
          error molestias corporis saepe facilis at incidunt animi eum quibusdam
          quod et quaerat doloribus. Maxime voluptatum maiores repellendus
          tempore magnam, mollitia quo non totam laudantium aliquid dolorem
          officiis nesciunt saepe minus eum odit aspernatur.
        </p>
      </div>
      <div className="w-[35%] sm:h-[200px] justify-center items-center hidden sm:flex">
        <img
          src="/maths.jpg"
          alt=""
          className="h-full w-full object-cover rounded-xl"
        />
      </div>
    </div>
  );
};

export default Home;
