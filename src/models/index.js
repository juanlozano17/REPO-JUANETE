import { productModel as Product } from './product.model.js';
import { categoryModel as Category } from './category.model.js';
import User from './user.model.js'; // <--- ¡Importa tu modelo de usuario aquí!

// Definir relaciones de productos
Category.hasMany(Product, { foreignKey: 'category_id' });
Product.belongsTo(Category, { foreignKey: 'category_id' });

// Exportar todos
export { Product, Category, User };