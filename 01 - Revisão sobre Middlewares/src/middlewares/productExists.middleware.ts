import { NextFunction, Request, Response } from "express";
import { productList } from "../database/inMemory.database";
import { ApiError } from "../errors/api.error";

export function productExists(req: Request, res: Response, next: NextFunction) {
  console.log("Middleware productExists executado!");

  const foundIndex = productList.findIndex(
    (product) => product.id === Number(req.params.productId)
  );

  if (foundIndex === -1) {
    throw new ApiError("Product not found", 404);
  }

  res.locals.foundProductIndex = foundIndex;

  // Ir para o próximo middleware da lista
  return next();
}
