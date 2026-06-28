import React from 'react';
import '../App.css';

const Login = ({ handleLogin, setUserLogin, userLogin, handleRegistro, setNuevoUsuario, nuevoUsuario }) => {
  return (
    <div className="auth-wrapper d-flex align-items-center justify-content-center bg-light">
      <div className="d-flex flex-row overflow-hidden shadow-lg" style={{ maxWidth: '1000px', width: '95%', borderRadius: '40px', backgroundColor: '#fff' }}>
        <div className="form-section p-5 d-flex flex-column justify-content-center" style={{ flex: '1' }}>
          <div className="text-center mb-4">
            <img src="/logo-pyp.png" alt="Logo" className="logo-img" />
            <h2 className="login-title mt-3">Ferroeléctricos P&P</h2>
            <p className="text-muted">Inicia sesión para gestionar el sistema</p>
          </div>
          <form onSubmit={handleLogin}>
            <div className="mb-3">
              <label className="auth-label ms-3">CORREO ELECTRÓNICO</label>
              <input type="text" className="auth-input form-control" required onChange={(e)=>setUserLogin({...userLogin, email:e.target.value})} />
            </div>
            <div className="mb-4">
              <label className="auth-label ms-3">CONTRASEÑA</label>
              <input type="password" placeholder="" className="auth-input form-control" required onChange={(e)=>setUserLogin({...userLogin, password:e.target.value})} />
            </div>
            <button className="btn btn-iniciar w-100 py-3">Ingresar</button>
          </form>
          <div className="auth-footer text-center mt-4">
            <button className="btn btn-link register-link" data-bs-toggle="modal" data-bs-target="#modalRegistro">¿No tienes cuenta? Regístrate</button>
          </div>
        </div>
        <div className="store-image-section d-none d-md-block" style={{ flex: '1', backgroundImage: 'url("/tienda-pyp.png")' }} />
      </div>

      {/* Modal de Registro */}
      <div className="modal fade" id="modalRegistro" tabIndex="-1">
        <div className="modal-dialog modal-dialog-centered">
          <div className="modal-content p-4 rounded-5 border-0 shadow">
            <h4 className="fw-bold text-center mb-4">Crear Nueva Cuenta</h4>
            <form onSubmit={handleRegistro}>
              <div className="row g-2">
                <div className="col-6 mb-2"><input type="text" placeholder="Nombre" className="form-control" required onChange={(e)=>setNuevoUsuario({...nuevoUsuario, nombre:e.target.value})} /></div>
                <div className="col-6 mb-2"><input type="text" placeholder="Apellidos" className="form-control" required onChange={(e)=>setNuevoUsuario({...nuevoUsuario, apellidos:e.target.value})} /></div>
                <div className="col-12 mb-2"><input type="email" placeholder="Correo electrónico" className="form-control" required onChange={(e)=>setNuevoUsuario({...nuevoUsuario, user:e.target.value})} /></div>
                <div className="col-6 mb-2"><input type="text" placeholder="Ciudad" className="form-control" required onChange={(e)=>setNuevoUsuario({...nuevoUsuario, ciudad:e.target.value})} /></div>
                <div className="col-6 mb-2"><input type="text" placeholder="Teléfono" className="form-control" required onChange={(e)=>setNuevoUsuario({...nuevoUsuario, telefono:e.target.value})} /></div>
                <div className="col-12 mb-2"><input type="password" placeholder="Contraseña" className="form-control" required onChange={(e)=>setNuevoUsuario({...nuevoUsuario, pass:e.target.value})} /></div>
              </div>
              <button className="btn btn-primary w-100 mt-4 py-2 rounded-pill fw-bold">Crear cuenta</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );

  const Login = ({ cambiarVista }) => {
   return (
      <button onClick={() => cambiarVista('dashboard')}>
         Ingresar
      </button>
   );
}
};

export default Login;