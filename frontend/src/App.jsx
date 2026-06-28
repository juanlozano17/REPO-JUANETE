import React, { useState } from 'react';
import Login from './pages/Login';
import AdminDashboard from './pages/AdminDashboard';
import ClientCatalog from './pages/ClientCatalog';
import ProductDetail from './pages/ProductDetail'; 
import CategoryView from './pages/CategoryView'; // Importa el nuevo componente

function App() {
  const [vista, setVista] = useState('inicio');
  const [selectedProductId, setSelectedProductId] = useState(null);

  const handleViewDetails = (id) => {
    setSelectedProductId(id);
    setVista('detalles');
  };

  return (
    <>
      {/* Catálogo Principal */}
      {vista === 'inicio' && (
        <ClientCatalog 
          cambiarVista={setVista} 
          verDetalles={handleViewDetails} 
        />
      )}
      
      {/* Vista de Categoría Decorativas */}
      {vista === 'decorativas' && (
        <CategoryView 
          categoria="Lámparas Decorativas" 
          productos={[
            { id: 1, nombre: 'Lámpara Colgante Vintage', precio: '$ 85.000', img: '/colgante.png' },
            { id: 2, nombre: 'Lámpara de Mesa Cristal', precio: '$ 120.000', img: '/lamparastecho.png' }
          ]}
          verDetalles={handleViewDetails}
        />
      )}
      
      {/* Otras vistas */}
      {vista === 'login' && <Login />}
      {vista === 'dashboard' && <AdminDashboard />}
      
      {vista === 'detalles' && (
        <ProductDetail 
          productId={selectedProductId} 
          regresar={() => setVista('inicio')} 
        />
      )}
    </>
  );
}

export default App;