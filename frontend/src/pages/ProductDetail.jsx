import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import api from '../services/api';

const ProductDetail = () => {
  const { id } = useParams();
  const [producto, setProducto] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    api.get(`/product/${id}`)
      .then((res) => setProducto(res.data.body))
      .catch((err) => console.error("Error al cargar:", err));
  }, [id]);

  if (!producto) return <div className="text-center mt-5 p-5"><h4>Cargando producto...</h4></div>;

  return (
    <div className="container my-5">
      <button className="btn btn-link text-decoration-none mb-4" onClick={() => navigate(-1)}>
        <i className="bi bi-arrow-left"></i> Volver al catálogo
      </button>
      
      <div className="row g-5">
        {/* Imagen */}
        <div className="col-md-6 text-center">
          <div className="p-4 bg-light rounded shadow-sm">
            <img src={producto.image_url} className="img-fluid" alt={producto.name} style={{ maxHeight: '400px' }} />
          </div>
        </div>

        {/* Detalles */}
        <div className="col-md-6">
          <h1 className="fw-bold display-5 mb-3">{producto.name}</h1>
          <h2 className="text-primary mb-4 fw-bold">
            $ {new Intl.NumberFormat('es-CO').format(producto.price)}
          </h2>
          
          <div className="d-grid gap-2 mb-4">
            <button className="btn btn-dark btn-lg">Añadir al carrito</button>
            {/* Aquí añadimos el icono del corazón */}
            <button className="btn btn-outline-primary">
              <i className="bi bi-heart me-2"></i> Lista de deseos
            </button>
          </div>

          <hr />
          <h5 className="fw-bold">Descripción</h5>
          <p className="text-muted mb-4">{producto.description}</p>

          {/* Aquí insertamos la tabla de especificaciones */}
          <h5 className="fw-bold mt-4">Especificaciones</h5>
          <table className="table table-striped mt-2">
            <tbody>
              <tr>
                <td className="fw-bold">Disponibilidad:</td>
                <td>{producto.stock > 0 ? `${producto.stock} unidades` : 'Agotado'}</td>
              </tr>
              <tr>
                <td className="fw-bold">Estado:</td>
                <td>Nuevo</td>
              </tr>
              <tr>
                <td className="fw-bold">Garantía:</td>
                <td>2 años</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default ProductDetail;