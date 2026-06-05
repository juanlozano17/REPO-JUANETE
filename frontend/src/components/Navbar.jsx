import React, { useState } from 'react';

const Navbar = ({ cambiarVista }) => {
  const [menuAbierto, setMenuAbierto] = useState(false);

  return (
    <>
      {/* Navbar principal */}
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

      {/* Menú lateral flotante */}
      {menuAbierto && (
        <div className="position-fixed bg-dark text-white p-4" 
             style={{ width: '280px', zIndex: 1050, height: '100vh', top: '0', left: 0 }}>
          <div className="d-flex flex-column h-100">
            <ul className="list-unstyled flex-grow-1 mt-5">
              <li className="py-3 border-bottom"><i className="bi bi-lamp me-3"></i>Lámparas decorativas</li>
              <li className="py-3 border-bottom"><i className="bi bi-house-door me-3"></i>Lámparas para interior</li>
              <li className="py-3 border-bottom"><i className="bi bi-sun me-3"></i>Lámparas para exterior</li>
              <li className="py-3 border-bottom"><i className="bi bi-lightbulb me-3"></i>Bombillos LED</li>
              <li className="py-3 border-bottom"><i className="bi bi-cpu me-3"></i>Iluminación Inteligente</li>
              <li className="py-3 border-bottom"><i className="bi bi-sliders me-3"></i>Control de Iluminación</li>
              <li className="py-3 border-bottom"><i className="bi bi-lightning me-3"></i>Cintas LED</li>
            </ul>
            <div className="mt-auto border-top pt-4">
              <p className="py-2 mb-0"><i className="bi bi-telephone-fill me-3"></i>Contacto</p>
              <p className="py-2 mb-0"><i className="bi bi-arrow-repeat me-3"></i>Cambios y garantías</p>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default Navbar;