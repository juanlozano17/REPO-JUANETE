import React, { useState } from 'react';
import Login from './pages/Login';
import AdminDashboard from './pages/AdminDashboard';
import ClientCatalog from './pages/ClientCatalog';
import ProductDetail from './pages/ProductDetail'; 

function App() {
  // 'vista' guarda qué pantalla estamos mostrando
  const [vista, setVista] = useState('inicio');
  // Nuevo estado para saber qué ID de producto estamos viendo
  const [selectedProductId, setSelectedProductId] = useState(null);

  // Función para manejar la navegación a detalles
  const handleViewDetails = (id) => {
    setSelectedProductId(id);
    setVista('detalles');
  };

  return (
    <>
      {/* Condicionales para mostrar el componente correcto */}
      {vista === 'inicio' && (
        <ClientCatalog 
          cambiarVista={setVista} 
          verDetalles={handleViewDetails} 
        />
      )}
      
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