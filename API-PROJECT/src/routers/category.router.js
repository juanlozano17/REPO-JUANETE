import { Router } from 'express';
import { createCategory, getCategories } from '../controller/category.controller.js';

const categoryRouter = Router();

// El primer argumento debe ser '/' porque en el index.js ya le pusiste '/api/v1/category'
categoryRouter.post('/', createCategory);
categoryRouter.get('/', getCategories);

export default categoryRouter;  