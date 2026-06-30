import { categoryModel } from '../models/category.model.js';

/**
 * @description Crea una nueva categoría de productos.
 * @route POST /api/v1/category
 */
export const createCategory = async (req, res) => {
    try {
        const newCategory = await categoryModel.create(req.body);
        return res.status(201).json({
            ok: true,
            status: 201,
            message: "Categoría creada con éxito :)",
            body: newCategory
        });
    } catch (error) {
        console.log("❌ Error en createCategory:", error);
        return res.status(500).json({
            ok: false,
            status: 500,
            message: "Error interno en el servidor al crear la categoría"
        });
    }
};

/**
 * @description Obtiene todas las categorías registradas.
 * @route GET /api/v1/category
 */
export const getCategories = async (req, res) => {
    try {
        const categories = await categoryModel.findAll();
        return res.status(200).json({
            ok: true,
            status: 200,
            message: "Categorías obtenidas con éxito",
            body: categories
        });
    } catch (error) {
        console.log("❌ Error en getCategories:", error);
        return res.status(500).json({
            ok: false,
            status: 500,
            message: "Error interno en el servidor"
        });
    }
};