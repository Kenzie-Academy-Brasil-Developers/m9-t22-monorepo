import { NextFunction, Request, Response } from "express";
import { ZodSchema } from "zod";

// Função que retorna outra função -> Currying -> HOF (High Order Function)
export function validateBody(schema: ZodSchema) {
  return (req: Request, res: Response, next: NextFunction) => {
    console.log("req.body ANTES da validação:");
    console.log(req.body);

    req.body = schema.parse(req.body);

    console.log("req.body DEPOIS da validação:");
    console.log(req.body);

    return next();
  };
}
