import { NextFunction, Request, Response } from "express";
import { ApiError } from "./api.error";
import { ZodError } from "zod";

export function handleGlobalErrors(
  error: Error,
  req: Request,
  res: Response,
  next: NextFunction
) {
  if (error instanceof ApiError) {
    return res.status(error.statusCode).json({ error: error.message });
  }

  if (error instanceof ZodError) {
    // 400 - Bad Request
    return res.status(400).json({ details: error.errors });
  }

  console.log(error);
  return res.status(500).json({ details: "Internal Server Error" });
}
