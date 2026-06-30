import bcryptjs from 'bcryptjs';
import jwt from 'jsonwebtoken';
import userModel from '../models/user.model.js';

export const createUser = async (req, res) => {
    try {
        const { user_user, user_password, userStatus_fk, role_fk } = req.body;
        
        const salt = await bcryptjs.genSalt(10);
        const passwordHash = await bcryptjs.hash(user_password, salt);

        const newUser = await userModel.create({
            user_user,
            user_password: passwordHash,
            userStatus_fk: userStatus_fk || 1,
            role_fk: role_fk || 2
        });

        const token = jwt.sign({ email: newUser.user_user }, process.env.JWK_SECRET, { expiresIn: '1h' });

        return res.status(201).json({
            ok: true,
            message: "Usuario creado exitosamente",
            id: newUser.user_id,
            token
        });
    } catch (error) {
        console.error("Error en registro:", error);
        return res.status(500).json({ message: "Error interno del servidor" });
    }
};

export const loginUser = async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await userModel.findOne({ where: { user_user: email } });
        if (!user) return res.status(400).json({ error: "Usuario no encontrado" });

        const isMatch = await bcryptjs.compare(password, user.user_password);
        if (!isMatch) return res.status(400).json({ error: "Credenciales inválidas" });

        const token = jwt.sign({ email: user.user_user }, process.env.JWK_SECRET, { expiresIn: '1h' });

        res.status(200).json({
            ok: true,
            message: "Login exitoso",
            id: user.user_id,
            token
        });
    } catch (error) {
        res.status(500).json({ message: "Error interno del servidor" });
    }
};

export const showUser = async (req, res) => {
    try {
        const users = await userModel.findAll();
        res.status(200).json({ ok: true, body: users });
    } catch (error) {
        res.status(500).json({ message: "Error al obtener usuarios" });
    }
};

export const updateUser = async (req, res) => {
    try {
        const idUser = req.params.id;
        const dataUser = req.body;
        
        const [updated] = await userModel.update(dataUser, {
            where: { user_id: idUser }
        });

        if (!updated) return res.status(404).json({ message: "Usuario no encontrado" });
        
        res.status(200).json({ ok: true, message: "Usuario actualizado correctamente" });
    } catch (error) {
        res.status(500).json({ message: "Error al actualizar" });
    }
};

export const deleteUser = async (req, res) => {
    try {
        const deleted = await userModel.destroy({ where: { user_id: req.params.id } });
        if (!deleted) return res.status(404).json({ message: "Usuario no encontrado" });
        res.status(200).json({ ok: true, message: "Usuario eliminado" });
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar" });
    }
};