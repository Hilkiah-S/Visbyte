import { apiSlice } from "./apiSlice";
const USERS_URL = "http://localhost:5000/api";

export const questionApiSlice = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    addQuestion: builder.mutation({
      query: (data) => ({
        url: `${USERS_URL}/exam/add-question`,
        method: "POST",
        body: data,
      }),
    }),
    viewQuestion: builder.mutation({
      query: (data) => ({
        url: `${USERS_URL}/exam/get-question`,
        method: "POST",
        body: data,
      }),
    }),

  }),
});

export const { useAddQuestionMutation, useViewQuestionMutation } =
questionApiSlice;
