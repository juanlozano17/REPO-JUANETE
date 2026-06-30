import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import api from '../services/api';

const Register = () => {
    const [form, setForm] = useState({ user_user: '', user_password: '' });
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await api.post('/user/register', form);
            alert("¡Registro exitoso!");
            navigate('/login');
        } catch (err) {
            alert("Error al crear cuenta: " + err.response?.data?.message);
        }
    };

    return (
        <div className="container mt-5">
            <form onSubmit={handleSubmit} className="card p-4 mx-auto" style={{ maxWidth: '400px' }}>
                <h3>Crear cuenta</h3>
                <input className="form-control mb-3" placeholder="Correo" 
                    onChange={e => setForm({...form, user_user: e.target.value})} />
                <input className="form-control mb-3" type="password" placeholder="Contraseña" 
                    onChange={e => setForm({...form, user_password: e.target.value})} />
                <button type="submit" className="btn btn-primary w-100">Registrarse</button>
            </form>
        </div>
    );
};
export default Register;