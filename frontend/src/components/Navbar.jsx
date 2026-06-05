import React, { useState } from 'react';

const Navbar = ({ cambiarVista }) => {
  const [menuAbierto, setMenuAbierto] = useState(false);

  // Lista de items para simplificar el código
  const menuItems = [
    { nombre: 'Lámparas decorativas', icono: 'bi-lamp', vista: 'decorativas' },
    { nombre: 'Lámparas para interior', icono: 'bi-house-door', vista: 'interior' },
    { nombre: 'Lámparas para exterior', icono: 'bi-sun', vista: 'exterior' },
    { nombre: 'Bombillos LED', icono: 'bi-lightbulb', vista: 'bombillos' },
    { nombre: 'Iluminación Inteligente', icono: 'bi-cpu', vista: 'inteligente' },
    { nombre: 'Control de Iluminación', icono: 'bi-sliders', vista: 'control' },
    { nombre: 'Cintas LED', icono: 'bi-lightning', vista: 'cintas' },
  ];

  return (
    <>
      <header className="d-flex align-items-center justify-content-between p-3 border-bottom shadow-sm bg-white" style={{ position: 'sticky', top: 0, zIndex: 1040 }}>
        <div className="d-flex align-items-center gap-3">
          <button className="btn" onClick={() => setMenuAbierto(!menuAbierto)}>
            <i className="bi bi-list fs-2"></i>
          </button>
          <img src="/logo-pyp.png" style={{ width: '60px', cursor: 'pointer' }} alt="Logo" onClick={() => cambiarVista('inicio')} />
        </div>

        <input type="text" className="form-control mx-4" placeholder="🔍 Buscar productos..." style={{ maxWidth: '400px' }} />

        <div className="d-flex gap-3 align-items-center">
          <span className="fw-bold">Iluminaria</span>
          <span className="fw-bold">Ferretería</span>
          <button className="btn btn-dark" onClick={() => cambiarVista('login')}>Acceso</button>
        </div>
      </header>

      {menuAbierto && (
        <div className="position-fixed bg-dark text-white p-4" 
             style={{ width: '280px', zIndex: 1050, height: '100vh', top: '0', left: 0 }}>
          <div className="d-flex flex-column h-100">
            <button className="btn btn-link text-white text-decoration-none align-self-end fs-4" onClick={() => setMenuAbierto(false)}>✕</button>
            
            <div className="flex-grow-1 mt-3">
              {menuItems.map((item, index) => (
                <button 
                  key={index} 
                  className="btn-menu-item" 
                  onClick={() => { cambiarVista(item.vista); setMenuAbierto(false); }}
                >
                  <i className={`bi ${item.icono} me-3`}></i> {item.nombre}
                </button>
              ))}
            </div>

            <div className="mt-auto border-top pt-4">
              <button className="btn-menu-item"><i className="bi bi-telephone-fill me-3"></i>Contacto</button>
              <button className="btn-menu-item"><i className="bi bi-arrow-repeat me-3"></i>Cambios y garantías</button>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default Navbar;