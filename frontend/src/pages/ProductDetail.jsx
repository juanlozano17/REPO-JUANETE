import React from 'react';
import Navbar from '../components/Navbar';

const ProductDetail = ({ productId, regresar, cambiarVista }) => {
  return (
    <>
      <Navbar cambiarVista={cambiarVista} />
      
      <div className="container my-5">
        <div className="d-flex justify-content-start mb-4">
        <button className="btn btn-outline-secondary" onClick={regresar}>
         ← Volver
        </button>
        </div>
        
        <div className="row align-items-start">
          {/* Columna Izquierda: Imagen */}
          <div className="col-md-5 text-center">
            <img src="/albarracin.jpg" className="img-fluid" alt="Lámpara Albaraccin" />
          </div>

          {/* Columna Derecha: Detalles */}
          <div className="col-md-7">
            <h1 className="fw-bold">ALBARACCIN Lámpara de colgar / colgante</h1>
            <p className="text-muted my-3">
              La lámpara colgante ALBARACIN está realizada con una pantalla esférica de cristal con efecto pan de oro. 
              La pantalla está suspendida mediante un cable textil negro de un dosel de metal redondo negro.
            </p>
            
            <div className="d-flex justify-content-between align-items-center my-4">
              <h3 className="fw-bold">$ 231.500 c/u</h3>
              <div className="d-flex gap-2">
                <input type="number" defaultValue="1" className="form-control" style={{ width: '60px' }} />
                <button className="btn btn-info text-white fw-bold">Añadir al carrito</button>
              </div>
            </div>

            <button className="btn btn-outline-info btn-sm mb-4">⚙️ Condiciones de la garantía</button>

            <h5><strong>Detalles del producto:</strong></h5>
            <table className="table table-borderless">
              <tbody>
                <tr><td>Material de la carcasa:</td><td><strong>Acero</strong></td></tr>
                <tr><td>Color de la carcasa:</td><td><strong>Negro</strong></td></tr>
                <tr><td>Material del vidrio / pantalla:</td><td><strong>Vidrio</strong></td></tr>
                <tr><td>Color del vidrio / pantalla:</td><td><strong>Dorado</strong></td></tr>
                <tr><td>Tipo de protección:</td><td><strong>IP20</strong></td></tr>
                <tr><td>Garantia:</td><td><strong>2 años</strong></td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductDetail;