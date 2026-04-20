import { z, defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';

const articles = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/articles' }),
  schema: z.object({
    title: z.string(),
    date: z.string(),
    source: z.string(),
    slug: z.string(),
    summary: z.string().optional(),
  }),
});

export const collections = { articles };
