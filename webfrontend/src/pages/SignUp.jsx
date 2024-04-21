import { useForm } from "react-hook-form";
import { useDispatch, useSelector } from "react-redux";
import { useSignupMutation } from "../slices/usersApiSlice";
import { setCredentials } from "../slices/authSlice";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";

export default function SignUp() {
  const [error, setError] = useState("");
  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
    reset,
  } = useForm({});

  const dispatch = useDispatch();
  const navigate = useNavigate();

  const [signup] = useSignupMutation();
  const { userInfo } = useSelector((state) => state.auth);

  useEffect(() => {
    if (userInfo) {
      navigate("/");
    }
  }, [navigate, userInfo]);

  const onSubmit = async (data) => {
    if (data.password !== data.confirmPassword) {
      setError("Password and Confirm password must be the same.");
    } else {
      try {
        const res = await signup(data).unwrap();
        dispatch(setCredentials({...res}));
        console.log(res);
        reset()
      } catch (err) {
        setError("Please provide valid data.");
        console.log(err);
      }
    }
  };

  return (
    <div className="flex gap-20 h-screen w-full">
      {/* left */}
      <div className="w-3/5 hidden sm:flex justify-center items-center bg-gradient-to-b from-orange-400 to-orange-800">
        <img src={"/login.png"} width={500} height={500} alt="Image"></img>
      </div>

      {/* right */}
      <div className="bg-white flex flex-col justify-center h-screen w-full">
        <form
          className="max-w-[450px] w-full mx-auto shadow px-10 py-10 border rounded-2xl"
          onSubmit={handleSubmit(onSubmit)}
        >
          <img
            src="/berhan-logo.jpg"
            className="w-20 h-20 rounded-2xl mx-auto"
            alt="Berhan platform"
          />
          <h2 className="text-2xl font-semibold font-mono text-center pt-2 pb-5">
            Berhan Platform
          </h2>

          <div className="flex flex-col py-2">
            <label className="font-semibold">Full name</label>
            <input
              className="border p-2 rounded-md"
              type="text"
              placeholder="Name"
              {...register("name", {required: true, minLength:3})}
            />

            {errors.fullname && (
              <p className="text-red-500 text-sm">* Please provide valid name.</p>
            )}
          </div>

          <div className="flex flex-col py-2">
            <label className="font-semibold">Email</label>
            <input
              className="border p-2 rounded-md"
              type="email"
              placeholder="Email"
              {...register("email", {required: true, minLength:3})}
            />

            {errors.email && (
              <p className="text-red-500 text-sm">* Please provide valid email.</p>
            )}
          </div>

          <div className="flex flex-col py-2">
            <label className="font-semibold">Password</label>
            <input
              className="border p-2 rounded-md"
              type="password"
              placeholder="Password"
              {...register("password", {required: true, minLength:8})}
            />

            {errors.password && (
              <p className="text-red-500 text-sm">* Password must conatins atleast 8 character(s).</p>
            )}
          </div>

          <div className="flex flex-col py-2">
            <label className="font-semibold">Confirm Password</label>
            <input
              className="border p-2 rounded-md"
              type="password"
              placeholder="Confirm password"
              {...register("confirmPassword", {required: true, minLength:8})}
            />
            {errors.confirmPassword && (
              <p className="text-red-500 text-sm">* Password must conatins atleast 8 character(s)</p>
            )}
            {error && (
              <p className="text-red-500 text-sm">* {error}</p>
            )}
          </div>
          <button
            disabled={isSubmitting}
            type="submit"
            className="font-semibold border w-full my-5 py-2 bg-orange-500 text-white disabled:bg-indigo-300 rounded-lg"
          >
            Sign Up
          </button>
          <p className="">
            Already registerd? <a href="/register" className="text-indigo-600">Login here</a>
          </p>
        </form>
      </div>
    </div>
  );
}
