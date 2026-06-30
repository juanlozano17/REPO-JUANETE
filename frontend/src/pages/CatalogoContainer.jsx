import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import api from '../services/api'; 
import CategoryView from './CategoryView';

const CatalogoContainer = () => {
  const [productos, setProductos] = useState([]);
  const [cargando, setCargando] = useState(true);
  const { idCategoria } = useParams();

  useEffect(() => {
    setCargando(true);
    
    // Si hay idCategoria, filtramos. Si no, traemos todo.
    const url = idCategoria ? `/product/category/${idCategoria}` : '/product/';

    api.get(url)
      .then((res) => {
        if (res.data && res.data.body) {
          const datosAdaptados = res.data.body.map(p => ({
            id: p.id,
            name: p.name || 'Sin nombre',
            price: p.price || '0',
            image_url: p.image_url || '',
            // Guardamos el nombre de la categoría real aquí
            nombreCategoria: p.Category ? p.Category.category_name : 'Productos disponibles'
          }));
          setProductos(datosAdaptados);
        }
        setCargando(false);
      })
      .catch((err) => {
        console.error("Error cargando productos:", err);
        setCargando(false);
      });
  }, [idCategoria]);

  if (cargando) return <div className="text-center mt-5">Cargando productos...</div>;

  // Si hay productos, usamos el nombre de la categoría del primer producto.
  // Si no hay productos, mostramos un mensaje genérico.
  const titulo = productos.length > 0 ? productos[0].nombreCategoria : "No hay productos disponibles";

  return (
    <CategoryView 
      categoria={titulo} 
      productos={productos} 
      verDetalles={(id) => console.log("Detalle de:", id)} 
    />
  );
};

export default CatalogoContainer;