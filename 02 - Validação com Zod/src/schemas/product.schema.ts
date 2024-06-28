import { z } from "zod";

export const productCreateSchema = z.object({
  name: z.string().min(1),
  // optional (undefined) / nullable (null) / nullish
  price: z.number(),
});

// TODO: Schema de atualização
