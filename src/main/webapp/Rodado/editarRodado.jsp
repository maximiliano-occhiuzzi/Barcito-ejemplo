<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sample.core.domain.Rodado" %>
<%
    // Recuperamos el objeto que el Servlet envió en el request
    Rodado rodado = (Rodado) request.getAttribute("rodado");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Rodado - Panel de Gestión</title>
    
    <!-- Bootstrap 5.3 -->
    <link href="https://jsdelivr.net" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cloudflare.com">
    <!-- Google Fonts: Poppins -->
    <link href="https://googleapis.com" rel="stylesheet">

    <style>
        :root { --primary-color: #4361ee; --bg-body: #f4f7fe; }
        body { font-family: 'Poppins', sans-serif; background-color: var(--bg-body); color: #2b3674; }
        .form-card { background: white; border: none; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); overflow: hidden; }
        .form-header { background: var(--primary-color); color: white; padding: 2rem; text-align: center; }
        .form-body { padding: 2.5rem; }
        .form-label { font-weight: 600; font-size: 0.85rem; color: #4a5568; margin-bottom: 0.5rem; }
        .form-control, .form-select { border-radius: 12px; padding: 0.75rem 1rem; border: 2px solid #edf2f7; }
        .input-group-text { background: #f8fafc; border: 2px solid #edf2f7; border-right: none; border-radius: 12px 0 0 12px; color: #a0aec0; }
        .btn-save { background: var(--primary-color); border: none; border-radius: 12px; padding: 12px; font-weight: 600; width: 100%; color: white; margin-top: 1.5rem; transition: 0.3s; }
        .btn-back { color: #718096; text-decoration: none; font-size: 0.9rem; display: inline-flex; align-items: center; margin-bottom: 1.5rem; }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            
            <a href="listarRodado" class="btn-back">
                <i class="fa-solid fa-arrow-left me-2"></i> Volver al listado
            </a>

            <div class="form-card">
                <div class="form-header">
                    <i class="fa-solid fa-car-side fa-3x mb-3"></i>
                    <h2 class="fw-bold mb-0">Editar Vehículo</h2>
                    <p class="mb-0 opacity-75">Actualizando datos de la patente: <%= rodado.getPatente() %></p>
                </div>

                <div class="form-body">
                    <form action="<%= request.getContextPath() %>/actualizarRodado" method="post">
                        
                        <div class="row">
                            <!-- Patente (ReadOnly) -->
                            <div class="col-md-6 mb-4">
                                <label for="patente" class="form-label">Patente</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                                    <input type="text" class="form-control bg-light" id="patente" name="patente" 
                                           value="<%= rodado.getPatente() %>" readonly>
                                </div>
                            </div>

                            <!-- Chasis -->
                            <div class="col-md-6 mb-4">
                                <label for="chasis" class="form-label">Número de Chasis</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-barcode"></i></span>
                                    <input type="text" class="form-control" id="chasis" name="chasis" 
                                           value="<%= rodado.getChasis() %>" required>
                                </div>
                            </div>

                            <!-- Color -->
                            <div class="col-md-4 mb-4">
                                <label for="color" class="form-label">Color</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-palette"></i></span>
                                    <input type="text" class="form-control" id="color" name="color" 
                                           value="<%= rodado.getColor() %>">
                                </div>
                            </div>

                            <!-- Caja -->
                            <div class="col-md-4 mb-4">
                                <label for="caja" class="form-label">Tipo de Caja</label>
                                <select class="form-select" id="caja" name="caja">
                                    <option value="MANUAL" <%= rodado.getCaja().name().equals("MANUAL") ? "selected" : "" %>>Manual</option>
                                    <option value="AUTOMATICO" <%= rodado.getCaja().name().equals("AUTOMATICO") ? "selected" : "" %>>Automática</option>
                                </select>
                            </div>

                            <!-- Motor -->
                            <div class="col-md-4 mb-4">
                                <label for="motor" class="form-label">Motor</label>
                                <select class="form-select" id="motor" name="motor">
                                    <option value="DIESEL" <%= rodado.getMotor().name().equals("DIESEL") ? "selected" : "" %>>Diesel</option>
                                    <option value="HIBRIDO" <%= rodado.getMotor().name().equals("HIBRIDO") ? "selected" : "" %>>Híbrido</option>
                                    <option value="ELECTRICO" <%= rodado.getMotor().name().equals("ELECTRICO") ? "selected" : "" %>>Eléctrico</option>
                                </select>
                            </div>

                            <!-- Estado -->
                            <div class="col-md-4 mb-4">
                                <label for="tipoEstado" class="form-label">Estado</label>
                                <select class="form-select" id="tipoEstado" name="tipoEstado">
                                    <option value="NUEVO" <%= rodado.getTipoEstado().name().equals("NUEVO") ? "selected" : "" %>>Nuevo</option>
                                    <option value="USADO" <%= rodado.getTipoEstado().name().equals("USADO") ? "selected" : "" %>>Usado</option>
                                </select>
                            </div>

                            <!-- Consumo -->
                            <div class="col-md-4 mb-4">
                                <label for="tipoConsumo" class="form-label">Consumo</label>
                                <select class="form-select" id="tipoConsumo" name="tipoConsumo">
                                    <option value="BAJO" <%= rodado.getTipoConsumo().name().equals("BAJO") ? "selected" : "" %>>Bajo</option>
                                    <option value="MEDIO" <%= rodado.getTipoConsumo().name().equals("MEDIO") ? "selected" : "" %>>Medio</option>
                                    <option value="ALTO" <%= rodado.getTipoConsumo().name().equals("ALTO") ? "selected" : "" %>>Alto</option>
                                </select>
                            </div>

                            <!-- Puertas -->
                            <div class="col-md-4 mb-4">
                                <label for="puertas" class="form-label">Puertas</label>
                                <select class="form-select" id="puertas" name="puertas">
                                    <option value="DOS" <%= rodado.getPuertas().name().equals("DOS") ? "selected" : "" %>>2 Puertas</option>
                                    <option value="CUATRO" <%= rodado.getPuertas().name().equals("CUATRO") ? "selected" : "" %>>4 Puertas</option>
                                    <option value="CINCO" <%= rodado.getPuertas().name().equals("CINCO") ? "selected" : "" %>>5 Puertas</option>
                                </select>
                            </div>

                            <!-- Tipo Rodado -->
                            <div class="col-md-12 mb-4">
                                <label for="tipoRodado" class="form-label">Tipo de Rodado</label>
                                <select class="form-select" id="tipoRodado" name="tipoRodado">
                                    <option value="AUTO" <%= rodado.getTipoRodado().name().equals("AUTO") ? "selected" : "" %>>Auto</option>
                                    <option value="MOTO" <%= rodado.getTipoRodado().name().equals("MOTO") ? "selected" : "" %>>Moto</option>
                                    <option value="CAMIONETA" <%= rodado.getTipoRodado().name().equals("CAMIONETA") ? "selected" : "" %>>Camioneta</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-save">
                            <i class="fa-solid fa-floppy-disk me-2"></i> Guardar Cambios
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
