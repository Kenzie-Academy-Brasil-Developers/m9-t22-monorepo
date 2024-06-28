import { Router } from "express";
import { ProductController } from "../controllers/product.controller";
import { productExists } from "../middlewares/productExists.middleware";
import { validateBody } from "../middlewares/validateBody.middleware";
import {
  productCreateSchema,
  productUpdateSchema,
} from "../schemas/product.schema";

export const productRouter = Router();

const productController = new ProductController();

// CRUD - Create / Read / Update / Delete
productRouter.post(
  "",
  validateBody(productCreateSchema),
  productController.create
);
productRouter.get("", productController.findAll);

// v1
productRouter.get("/:productId", productExists, productController.findById);

productRouter.patch(
  "/:productId",
  productExists,
  validateBody(productUpdateSchema),
  productController.partialUpdate
);

productRouter.delete("/:productId", productExists, productController.delete);

// Equivale a v1 acima, só que mais reduzida
// productRouter.use("/:productId", productExists);

// productRouter.get("/:productId", productController.findById);
// productRouter.patch("/:productId", productController.partialUpdate);
// productRouter.delete("/:productId", productController.delete);
