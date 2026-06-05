import React, { useState } from 'react';
import Login from './pages/Login';
import AdminDashboard from './pages/AdminDashboard';
import ClientCatalog from './pages/ClientCatalog';

function App() {
  // 'vista' guarda qué pantalla estamos mostrando
  const [vista, setVista] = useState('inicio'); 

  return (
    <>
      {/* Condicionales para mostrar el componente correcto */}
      {vista === 'inicio' && <ClientCatalog cambiarVista={setVista} />}
      {vista === 'login' && <Login />}
      {vista === 'dashboard' && <AdminDashboard />}
    </>
  );
}

export default App;