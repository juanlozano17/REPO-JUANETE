import { DataTypes } from 'sequelize';
import db from '../config/connect.db.js';
import { categoryModel } from './category.model.js'; 

/**
 * @description Modelo de datos para la tabla de Productos con sus respectivos atributos.
 */
export const productModel = db.define('Product', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false
    },
    description: {
        type: DataTypes.TEXT
    },
    price: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false
    },
    stock: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0
    },
    image_url: {
        type: DataTypes.STRING
    },
    status: {
        type: DataTypes.ENUM('active', 'inactive', 'out_of_stock'),
        defaultValue: 'active'
    }
}, {
    tableName: 'products',
    timestamps: true
});

// Relación de Llaves Foráneas (1 categoría tiene muchos productos)
categoryModel.hasMany(productModel, { foreignKey: 'category_id' });
productModel.belongsTo(categoryModel, { foreignKey: 'category_id' });