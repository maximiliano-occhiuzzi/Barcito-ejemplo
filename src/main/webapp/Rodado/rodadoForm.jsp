<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuevo Rodado - Panel de Gestión</title>
    
    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com">
    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com" rel="stylesheet">

    <style>
        :root {
            --primary-color: #4361ee;
            --bg-body: #f4f7fe;
        }

        body { 
            font-family: 'Poppins', sans-serif; 
            background-color: var(--bg-body);
            color: #2b3674;
        }

        .form-card {
            background: white;
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .form-header {
            background: var(--primary-color);
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .form-body {
            padding: 2.5rem;
        }

        .form-label {
            font-weight: 600;
            font-size: 0.85rem;
            color: #4a5568;
            margin-bottom: 0.5rem;
        }

        .form-control, .form-select {
            border-radius: 12px;
            padding: 0.75rem 1rem;
            border: 2px solid #edf2f7;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(67, 97, 238, 0.1);
        }

        .input-group-text {
            background: #f8fafc;
            border: 2px solid #edf2f7;
            border-right: none;
            border-radius: 12px 0 0 12px;
            color: #a0aec0;
        }

        .has-icon .form-control {
            border-radius: 0 12px 12px 0;
        }

        .btn-save {
            background: var(--primary-color);
            border: none;
            border-radius: 12px;
            padding: 12px;
            font-weight: 600;
            width: 100%;
            margin-top: 1.5rem;
            transition: 0.3s;
        }

        .btn-save:hover {
            background: #3f37c9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }

        .btn-back {
            color: #718096;
            text-decoration: none;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            margin-bottom: 1.5rem;
            transition: 0.2s;
        }

        .btn-back:hover { color: var(--primary-color); }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            
            <!-- Botón Volver -->
            <a href="listarRodado" class="btn-back">
                <i class="fa-solid fa-arrow-left me-2"></i> Volver al listado
            </a>

            <div class="form-card">
                <div class="form-header">
                    <i class="fa-solid fa-car-side fa-3x mb-3"></i>
                    <h2 class="fw-bold mb-0">Registrar Vehículo</h2>
                    <p class="mb-0 opacity-75">Completa los datos técnicos del rodado</p>
                </div>

                <div class="form-body">
                    <form class="form-crear-rodado" action="<%= request.getContextPath() %>/crearRodado" method="post">
                        
                        <div class="row">
                            <!-- Patente -->
                            <div class="col-md-6 mb-4">
                                <label for="patente" class="form-label">Patente</label>
                                <div class="input-group has-icon">
                                    <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                                    <input type="text" class="form-control" id="patente" name="patente" placeholder="Ej: ABC 123" required>
                                </div>
                            </div>

                            <!-- Chasis -->
                            <div class="col-md-6 mb-4">
                                <label for="chasis" class="form-label">Número de Chasis</label>
                                <div class="input-group has-icon">
                                    <span class="input-group-text"><i class="fa-solid fa-barcode"></i></span>
                                    <input type="text" class="form-control" id="chasis" name="chasis" placeholder="Nro de bastidor" required>
                                </div>
                            </div>

                            <!-- Color -->
                            <div class="col-md-4 mb-4">
                                <label for="color" class="form-label">Color</label>
                                <div class="input-group has-icon">
                                    <span class="input-group-text"><i class="fa-solid fa-palette"></i></span>
                                    <input type="text" class="form-control" id="color" name="color" placeholder="Ej: Azul">
                                </div>
                            </div>

                            <!-- Caja -->
                            <div class="col-md-4 mb-4">
                                <label for="caja" class="form-label">Tipo de Caja</label>
                                <select class="form-select" id="caja" name="caja">
                                    <option value="MANUAL">Manual</option>
                                    <option value="AUTOMATICO">Automática</option>
                                </select>
                            </div>

                            <!-- Motor -->
                            <div class="col-md-4 mb-4">
                                <label for="motor" class="form-label">Motor</label>
                                <select class="form-select" id="motor" name="motor">
                                    <option value="DIESEL">Diesel</option>
                                    <option value="HIBRIDO">Híbrido</option>
                                    <option value="ELECTRICO">Eléctrico</option>
                                </select>
                            </div>

                            <!-- Estado -->
                            <div class="col-md-4 mb-4">
                                <label for="TipoEstado" class="form-label">Estado</label>
                                <select class="form-select" id="TipoEstado" name="TipoEstado">
                                    <option value="NUEVO">Nuevo</option>
                                    <option value="USADO">Usado</option>
                                </select>
                            </div>

                            <!-- Consumo -->
                            <div class="col-md-4 mb-4">
                                <label for="TipoConsumo" class="form-label">Consumo</label>
                                <select class="form-select" id="TipoConsumo" name="TipoConsumo">
                                    <option value="BAJO">Bajo</option>
                                    <option value="MEDIO">Medio</option>
                                    <option value="ALTO">Alto</option>
                                </select>
                            </div>

                            <!-- Puertas -->
                            <div class="col-md-4 mb-4">
                                <label for="puertas" class="form-label">Puertas</label>
                                <select class="form-select" id="puertas" name="puertas">
                                    <option value="DOS">2 Puertas</option>
                                    <option value="TRES">3 Puertas</option>
                                    <option value="CUATRO">4 Puertas</option>
                                    <option value="CINCO">5 Puertas</option>
                                </select>
                            </div>

                            <!-- Categoría -->
                            <div class="col-md-12 mb-4">
                                <label for="TipoRodado" class="form-label">Categoría del Vehículo</label>
                                <div class="input-group has-icon">
                                    <span class="input-group-text"><i class="fa-solid fa-truck-pickup"></i></span>
                                    <select class="form-select" id="TipoRodado" name="TipoRodado">
                                        <option value="AUTO">Auto</option>
                                        <option value="CAMIONETA">Camioneta</option>
                                        <option value="MOTO">Moto</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary btn-save text-white shadow-sm">
                            <i class="fa-solid fa-cloud-arrow-up me-2"></i> Guardar Registro
                        </button>

                        <div class="mt-4">
                            <% if ("success".equals(request.getParameter("status"))) { %>
                                <div class="alert alert-success border-0 rounded-4 shadow-sm d-flex align-items-center">
                                    <i class="fa-solid fa-circle-check fs-4 me-3"></i>
                                    <div>¡Rodado guardado con éxito!</div>
                                </div>
                            <% } else if ("error".equals(request.getParameter("status"))) { %>
                                <div class="alert alert-danger border-0 rounded-4 shadow-sm d-flex align-items-center">
                                    <i class="fa-solid fa-circle-exclamation fs-4 me-3"></i>
                                    <div>Hubo un error. Revisa los datos ingresados.</div>
                                </div>
                            <% } %>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net"></script>
</body>
</html>
