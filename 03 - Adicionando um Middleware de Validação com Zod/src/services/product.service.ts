import { generateNextId, productList } from "../database/inMemory.database";
import { ApiError } from "../errors/api.error";
import {
  Product,
  ProductCreate,
  ProductUpdate,
} from "../interfaces/product.interfaces";

/*
  SERVICES
  - Implementa lógica de negócio (regra de negócio), se comunicando com a base de dados
*/
export class ProductService {
  public create = (payload: ProductCreate): Product => {
    const newProduct = {
      id: generateNextId(),
      ...payload,
      createdAt: new Date(),
      updatedAt: new Date(),
    };

    productList.push(newProduct);

    return newProduct;
  };

  public findAll = () => {
    return productList;
  };

  public findById = (productIndex: number) => {
    console.log("Service ProductService().findById executado!");

    return productList[productIndex];
  };

  public partialUpdate = (productIndex: number, payload: ProductUpdate) => {
    // 2. Se existir, atualizar os campos
    const updatedProduct = {
      ...productList[productIndex],
      ...payload,
      updatedAt: new Date(),
    };

    productList.splice(productIndex, 1, updatedProduct);

    return updatedProduct;
  };

  public delete = (productIndex: number) => {
    productList.splice(productIndex, 1);
  };
}
