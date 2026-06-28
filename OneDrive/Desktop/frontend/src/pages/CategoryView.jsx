import React from 'react';

const CategoryView = ({ categoria, productos, verDetalles }) => {
  return (
    <div className="container my-5">
      <h1 className="fw-bold mb-4">{categoria}</h1>
      <div className="row g-4">
        {productos.map((prod, index) => (
          <div key={index} className="col-lg-3 col-md-4 col-sm-6">
            <div className="card h-100 border-0 shadow-sm p-3">
              <img src={prod.img} className="card-img-top img-fluid" alt={prod.nombre} />
              <div className="card-body text-center">
                <h6 className="fw-bold">{prod.nombre}</h6>
                <p className="text-primary fw-bold">{prod.precio}</p>
                <button 
                  className="btn btn-outline-dark w-100"
                  onClick={() => verDetalles(prod.id)}
                >
                  Ver Detalles
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default CategoryView;