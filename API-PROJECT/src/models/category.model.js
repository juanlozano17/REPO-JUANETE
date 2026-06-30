import { DataTypes } from 'sequelize';
import db from '../config/connect.db.js';

/**
 * @description 
 */
export const categoryModel = db.define('Category', {
    category_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    category_name: {
        type: DataTypes.STRING,
        allowNull: false
    }
}, {
    tableName: 'categories',
    timestamps: true
});