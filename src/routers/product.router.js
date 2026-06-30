import { Router } from 'express'; 
import { 
    createProduct, 
    getProducts, 
    getProductsByCategory, 
    getProductById,
    updateProduct,
    deleteProduct
} from '../controller/product.controller.js';

const productRouter = Router(); 

// ... resto de tus rutas
productRouter.post('/', createProduct);
productRouter.get('/', getProducts);
productRouter.get('/category/:categoryId', getProductsByCategory);
productRouter.get('/:id', getProductById);
productRouter.put('/:id', updateProduct);
productRouter.delete('/:id', deleteProduct);

export default productRouter;