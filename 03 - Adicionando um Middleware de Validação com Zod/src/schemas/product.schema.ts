import { z } from "zod";

export const productCreateSchema = z.object({
  name: z.string().min(1),
  price: z.number(),
});

// TODO: Schema de atualização
// export const productUpdateSchema = z.object({
//   // optional (undefined) / nullable (null) / nullish
//   name: z.string().min(1).optional(),
//   price: z.number().optional(),
// });

export const productUpdateSchema = productCreateSchema.partial();
