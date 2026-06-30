import { productModel } from '../models/product.model.js';
import { Product, Category } from '../models/index.js';
import { categoryModel } from '../models/category.model.js';

/**
 * @description Crea un nuevo producto vinculándolo a una categoría.
 * @route POST /api/v1/product
 */
export const createProduct = async (req, res) => {
    try {
        const newProduct = await productModel.create(req.body);
        return res.status(201).json({
            ok: true,
            status: 201,
            message: "Producto creado con éxito :)",
            body: newProduct
        });
    } catch (error) {
        console.log("❌ Error en createProduct:", error);
        return res.status(500).json({
            ok: false,
            status: 500,
            message: "Error interno al crear el producto"
        });
    }
};

/**
 * @description Obtiene todos los productos incluyendo la información de su categoría.
 * @route GET /api/v1/product
 */
export const getProducts = async (req, res) => {
    try {
        const products = await productModel.findAll({
            include: {
                model: categoryModel,
                attributes: ['category_name']
            }
        });
        return res.status(200).json({
            ok: true,
            status: 200,
            message: "Productos obtenidos con éxito",
            body: products
        });
    } catch (error) {
        console.log("❌ Error en getProducts:", error);
        return res.status(500).json({
            ok: false,
            status: 500,
            message: "Error interno al obtener los productos"
        });
    }
};

/**
 * @description Obtiene productos filtrados por una categoría específica.
 * @route GET /api/v1/product/category/:categoryId
 */
export const getProductsByCategory = async (req, res) => {
    try {
        const { categoryId } = req.params;
        
        const products = await productModel.findAll({
            where: { category_id: categoryId },
            include: {
                model: categoryModel,
                attributes: ['category_name']
            }
        });

        return res.status(200).json({
            ok: true,
            status: 200,
            message: "Productos de la categoría obtenidos con éxito",
            body: products
        });
    } catch (error) {
        console.log("❌ Error en getProductsByCategory:", error);
        return res.status(500).json({
            ok: false,
            status: 500,
            message: "Error interno al obtener los productos por categoría"
        });
    }
};

export const getProductById = async (req, res) => {
    try {
        const { id } = req.params;
        const producto = await Product.findByPk(id, {
            include: { model: Category }
        });
        
        if (!producto) {
            return res.status(404).json({ ok: false, message: "Producto no encontrado" });
        }
        res.status(200).json({ ok: true, body: producto });
    } catch (error) {
        res.status(500).json({ ok: false, message: "Error al obtener producto", error });
    }
};

/**
 * @description Actualiza un producto existente según su ID.
 * @route PUT /api/v1/product/:id
 */
export const updateProduct = async (req, res) => {
    try {
        const { id } = req.params;
        const [updatedRows] = await productModel.update(req.body, {
            where: { id }
        });

        if (updatedRows === 0) {
            return res.status(404).json({
                ok: false,
                status: 404,
                message: "Producto no encontrado para actualizar"
            });
        }

        return res.status(200).json({
            ok: true,
            status: 200,
            message: "Producto actualizado con éxito"
        });
    } catch (error) {
        console.log("❌ Error en updateProduct:", error);
        return res.status(500).json({
            ok: false,
            status: 500,
            message: "Error interno al actualizar el producto"
        });
    }
};

/**
 * @description Elimina de forma lógica o física un producto según su ID.
 * @route DELETE /api/v1/product/:id
 */
export const deleteProduct = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedRows = await productModel.destroy({
            where: { id }
        });

        if (deletedRows === 0) {
            return res.status(404).json({
                ok: false,
                status: 404,
                message: "Producto no encontrado"
            });
        }

        return res.status(200).json({
            ok: true,
            status: 200,
            message: "Producto eliminado con éxito"
        });
    } catch (error) {
        console.log("❌ Error en deleteProduct:", error);
        return res.status(500).json({
            ok: false,
            status: 500,
            message: "Error interno al eliminar el producto"
        });
    }
};