import { useEffect, useState } from 'react';
import api from '../services/api'; // Asegúrate de que esta ruta sea correcta según tu estructura

const Catalogo = () => {
  const [productos, setProductos] = useState([]);
  const [cargando, setCargando] = useState(true);

  useEffect(() => {
    // Llamamos a la API que configuramos en tu archivo services/api.js
    api.get('/productos')
      .then((response) => {
        setProductos(response.data); // Guardamos los productos reales en el estado
        setCargando(false);
      })
      .catch((error) => {
        console.error("Error al traer productos:", error);
        setCargando(false);
      });
  }, []);

  if (cargando) return <p>Cargando productos...</p>;

  return (
    <div className="catalogo">
      <h2>Catálogo de Productos</h2>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '20px' }}>
        {productos.map((prod) => (
          <div key={prod.id} className="tarjeta-producto" style={{ border: '1px solid #ccc', padding: '15px' }}>
            <h3>{prod.name}</h3>
            <p>{prod.description}</p>
            <p><strong>Precio:</strong> ${prod.price}</p>
            <p><strong>Stock:</strong> {prod.stock}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Catalogo;