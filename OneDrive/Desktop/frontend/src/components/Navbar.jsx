import React, { useState } from 'react';

const Navbar = ({ cambiarVista }) => {
  const [menuAbierto, setMenuAbierto] = useState(false);

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
        
        {/* Izquierda: Categorías y Buscador */}
        <div className="d-flex align-items-center gap-3" style={{ flex: 1 }}>
          <button className="btn d-flex align-items-center gap-2" onClick={() => setMenuAbierto(!menuAbierto)}>
            <i className="bi bi-list fs-3"></i> 
          </button>
          <div className="input-group" style={{ maxWidth: '300px' }}>
            <span className="input-group-text bg-white border-end-0"><i className="bi bi-search text-dark"></i></span>
            <input type="text" className="form-control border-start-0" placeholder="Buscar..." />
          </div>
        </div>

        {/* Centro: Logo */}
        <div className="text-center" style={{ flex: 1 }}>
          <img src="/logo-pyp.png" style={{ width: '60px', cursor: 'pointer' }} alt="Logo" onClick={() => cambiarVista('inicio')} />
        </div>

        {/* Derecha: Lista de deseos, Cuenta y Carrito (Iconos negros) */}
        <div className="d-flex gap-3 align-items-center justify-content-end" style={{ flex: 1 }}>
          <button className="btn btn-link text-decoration-none text-dark p-0" onClick={() => cambiarVista('deseos')}>
            <i className="bi bi-heart text-dark me-1"></i> Lista de deseos
          </button>
          <button className="btn btn-link text-decoration-none text-dark p-0" onClick={() => cambiarVista('login')}>
            <i className="bi bi-person-fill"></i> Cuenta
          </button>
          <button className="btn btn-link text-decoration-none text-dark p-0" onClick={() => cambiarVista('carrito')}>
            <i className="bi bi-cart3 text-dark"></i> Carrito
          </button>
        </div>
      </header>

      {/* Menú lateral */}
      {menuAbierto && (
        <div className="position-fixed bg-dark text-white p-4" style={{ width: '280px', zIndex: 1050, height: '100vh', top: '0', left: 0 }}>
          <div className="d-flex flex-column h-100">
            <button className="btn btn-link text-white text-decoration-none align-self-end fs-4" onClick={() => setMenuAbierto(false)}>✕</button>
            <div className="flex-grow-1 mt-3">
              {menuItems.map((item, index) => (
                <button key={index} className="btn btn-menu-item w-100 text-start text-white" onClick={() => { cambiarVista(item.vista); setMenuAbierto(false); }}>
                  <i className={`bi ${item.icono} me-3`}></i> {item.nombre}
                </button>
              ))}
            </div>
            <div className="mt-auto border-top pt-4">
              <button className="btn btn-menu-item w-100 text-start text-white" onClick={() => { cambiarVista('contacto'); setMenuAbierto(false); }}>
                <i className="bi bi-telephone-fill me-3"></i>Contacto
              </button>
              <button className="btn btn-menu-item w-100 text-start text-white" onClick={() => { cambiarVista('garantias'); setMenuAbierto(false); }}>
                <i className="bi bi-arrow-repeat me-3"></i>Cambios y garantías
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default Navbar;