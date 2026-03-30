<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sample.core.domain.Rodado"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Panel de Control - Flota de Rodados</title>

<!-- Bootstrap 5.3 -->
<link href="https://cdn.jsdelivr.net" rel="stylesheet">
<!-- Font Awesome para íconos -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com">
<!-- Google Fonts: Poppins -->
<link href="https://fonts.googleapis.com" rel="stylesheet">

<style>
:root {
	--primary-color: #4361ee;
	--secondary-color: #3f37c9;
	--bg-body: #f4f7fe;
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: var(--bg-body);
	color: #2b3674;
}

.main-card {
	border: none;
	border-radius: 20px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
	background: white;
	padding: 2rem;
}

.table {
	border-collapse: separate;
	border-spacing: 0 10px;
}

.table thead th {
	border: none;
	color: #a3aed0;
	font-weight: 600;
	text-transform: uppercase;
	font-size: 0.75rem;
	letter-spacing: 1px;
	padding-bottom: 20px;
}

.table tbody tr {
	background-color: white;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.02);
	border-radius: 12px;
	transition: all 0.3s ease;
}

.table tbody tr:hover {
	transform: scale(1.01);
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.05);
}

.table td {
	padding: 1.5rem 1rem;
	vertical-align: middle;
	border: none;
}

.patente-cell {
	font-weight: 600;
	color: var(--primary-color);
	background: #eef2ff;
	padding: 8px 12px;
	border-radius: 8px;
}

.btn-add {
	background: var(--primary-color);
	border: none;
	border-radius: 12px;
	padding: 10px 24px;
	font-weight: 600;
	transition: 0.3s;
}

.btn-add:hover {
	background: var(--secondary-color);
	box-shadow: 0 4px 15px rgba(67, 97, 238, 0.4);
}

.badge-status {
	padding: 8px 12px;
	border-radius: 10px;
	font-size: 0.75rem;
}

.action-icon {
	width: 35px;
	height: 35px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border-radius: 10px;
	text-decoration: none;
	transition: 0.2s;
}

.icon-edit {
	background: #fff4e5;
	color: #ffab00;
}

.icon-delete {
	background: #ffe5e5;
	color: #ff5b5c;
}

.icon-edit:hover {
	background: #ffab00;
	color: white;
}

.icon-delete:hover {
	background: #ff5b5c;
	color: white;
}

.empty-state {
	padding: 60px;
	text-align: center;
}
</style>
</head>
<body>

	<div class="container py-5">
		<!-- Header -->
		<div class="d-flex justify-content-between align-items-center mb-5">
			<div>
				<h1 class="fw-bold h2 mb-1 text-dark">Flota de Vehículos</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#"
							class="text-decoration-none">Dashboard</a></li>
						<li class="breadcrumb-item active">Rodados</li>
					</ol>
				</nav>
			</div>
			<a href="<%=request.getContextPath()%>/Rodado/rodadoForm.jsp"
				class="btn btn-primary btn-add"> <i
				class="fa-solid fa-plus me-2"></i> Nuevo Rodado
			</a>
		</div>

		<!-- Main Table Card -->
		<div class="main-card">
			<div class="table-responsive">
				<table class="table align-middle">
					<thead>
						<tr>
							<th>Vehículo</th>
							<th>Chasis / Color</th>
							<th>Especificaciones</th>
							<th>Estado</th>
							<th>Categoría</th>
							<th class="text-end">Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Rodado> lista = (List<Rodado>) request.getAttribute("listaRodados");
						if (lista != null && !lista.isEmpty()) {
							for (Rodado r : lista) {
						%>
						<tr>
							<td>
								<div class="d-flex align-items-center">
									<span class="patente-cell me-3 text-uppercase"><%=r.getPatente()%></span>
								</div>
							</td>
							<td>
								<div class="small fw-bold">
									Chasis:
									<%=r.getChasis()%></div>
								<div class="text-muted small">
									<i class="fa-solid fa-palette me-1"></i>
									<%=r.getColor()%></div>
							</td>
							<td>
								<div class="small mb-1">
									<i class="fa-solid fa-gear text-muted me-1"></i>
									<%=r.getCaja()%>
								</div>
								<div class="small">
									<i class="fa-solid fa-gas-pump text-muted me-1"></i>
									<%=r.getMotor()%>
								</div>
							</td>
							<td><span
								class="badge badge-status <%=r.getTipoEstado().toString().equals("NUEVO") ? "bg-success-subtle text-success"
		: "bg-warning-subtle text-warning"%>">
									<i class="fa-solid fa-circle fa-2xs me-1"></i> <%=r.getTipoEstado()%>
							</span></td>
							<td><span
								class="fw-semibold small text-uppercase text-secondary">
									<i class="fa-solid fa-car-side me-1"></i> <%=r.getTipoRodado()%>
							</span></td>
							<td class="text-end"><a
								href="editar?id=<%=r.getPatente()%>"
								class="action-icon icon-edit shadow-sm me-1" title="Editar">
									<i class="fa-solid fa-pen-to-square"></i>
							</a> <a href="eliminar?id=<%=r.getPatente()%>"
								class="action-icon icon-delete shadow-sm" title="Borrar"
								onclick="return confirm('¿Seguro que deseas eliminar este rodado?')">
									<i class="fa-solid fa-trash"></i>
							</a></td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td colspan="6">
								<div class="empty-state">
									<i class="fa-solid fa-car-rear fa-4x text-light mb-3"></i>
									<h5 class="text-muted">No hay rodados registrados</h5>
									<p class="small text-muted">Comienza agregando un nuevo
										vehículo al inventario.</p>
								</div>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net"></script>
</body>
</html>
