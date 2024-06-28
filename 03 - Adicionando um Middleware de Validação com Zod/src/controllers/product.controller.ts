import { Request, Response } from "express";
import { ProductService } from "../services/product.service";
import {
  productCreateSchema,
  productUpdateSchema,
} from "../schemas/product.schema";

/*
  CONTROLLERS
  - Manuear requisições (requests / entrada) e respostas (responses / saída)
*/

export class ProductController {
  public create = (req: Request, res: Response) => {
    /*
      Possibilidades:
      - Dados nao passa da validação:
        - Um ZodError será levantado pelo método parse.
      - Dados passam na validação
        - Chaves obrigatórias passadas.
        - Tipos das chaves obrigatórias condizem com as regras do schema
        - Chaves extras serão eliminadas pelo zod se a validação deu certo.
        - Dados validos são retornados pelo método parse.
    */
    //  Notification Pattern:
    // todos os erros são verificados e retornados de uma só vez para o usuario
    const productService = new ProductService();
    const newProduct = productService.create(req.body);

    // 201 -> CREATED
    return res.status(201).json(newProduct);
  };

  public findAll = (req: Request, res: Response) => {
    const productService = new ProductService();
    const products = productService.findAll();

    return res.json(products);
  };

  public findById = (req: Request, res: Response) => {
    console.log("Controller ProductController().findById executado!");
    const productService = new ProductService();

    const { foundProductIndex } = res.locals;

    const product = productService.findById(foundProductIndex);

    return res.json(product);
  };

  public partialUpdate = (req: Request, res: Response) => {
    const productService = new ProductService();

    const { foundProductIndex } = res.locals;
    const updatedProduct = productService.partialUpdate(
      foundProductIndex,
      req.body
    );

    return res.json(updatedProduct);
  };

  public delete = (req: Request, res: Response) => {
    const productService = new ProductService();

    const { foundProductIndex } = res.locals;
    productService.delete(foundProductIndex);

    return res.status(204).json();
  };
}
