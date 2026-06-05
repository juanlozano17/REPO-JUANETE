import React from 'react';
import '../App.css'; 

const ClientCatalog = ({ cambiarVista }) => {
  // Array con los datos de las categorías
  const categorias = [
    { nombre: 'Cintas LED', cant: '19', img: '/cintasled.png' },
    { nombre: 'Lámparas colgantes', cant: '30', img: '/colgante.png' },
    { nombre: 'Lámparas de techo', cant: '29', img: '/lamparastecho.png' },
    { nombre: 'Lámparas T5', cant: '17', img: '/t5.png' },
    { nombre: 'Paneles LED', cant: '33', img: '/paneles.png' }
  ];

  return (
    <div className="container-fluid p-0">
      {/* 1. Header */}
      <header className="d-flex align-items-center justify-content-between p-3 border-bottom shadow-sm">
        <img src="/logo-pyp.png" style={{ width: '60px' }} alt="Logo" />
        <input type="text" className="form-control mx-4" placeholder="🔍 Buscar productos..." style={{ maxWidth: '400px' }} />
        <div className="d-flex gap-3 align-items-center">
          <span className="fw-bold">Iluminaria</span>
          <span className="fw-bold">Ferretería</span>
          <button className="btn btn-dark" onClick={() => cambiarVista('login')}>Acceso</button>
        </div>
      </header>

      {/* 2. Banner Principal */}
      <section className="container my-5">
        <div className="row align-items-center">
          <div className="col-md-6">
            <h1 className="display-4 fw-bold">Lámparas colgantes</h1>
            <p className="lead">Descubre las elegantes Lámparas colgantes perfectas para tu hogar, estas lámparas colgantes decorativas de metal negro añade un toque de sofisticación.</p>
            <button className="btn btn-dark btn-lg mt-3">Detalles de este producto</button>
            <div className="mt-4"><span className="border p-2 rounded">30 productos disponibles</span></div>
          </div>
          <div className="col-md-6 text-center">
            <img src="/lamparas.jpg" className="img-fluid rounded" style={{ maxWidth: '400px' }} alt="Lámpara" />
          </div>
        </div>
      </section>

      {/* 3. Categorías generadas dinámicamente */}
      <section className="bg-light p-5 text-center">
        <h3 className="mb-5">Categorías importantes</h3>
        <div className="container">
          <div className="row justify-content-center g-4">
            {categorias.map((cat, index) => (
              <div key={index} className="col-lg-2 col-md-4 col-sm-6">
                <div className="card p-3 border-0 shadow-sm h-100 align-items-center">
                  <img src={cat.img} alt={cat.nombre} className="img-fluid mb-2" style={{ height: '80px', objectFit: 'contain' }} />
                  <p className="fw-bold mb-0">{cat.nombre}</p>
                  <small className="text-muted">{cat.cant} productos</small>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};

export default ClientCatalog;