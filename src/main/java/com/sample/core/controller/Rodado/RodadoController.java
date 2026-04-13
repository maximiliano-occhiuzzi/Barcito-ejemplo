package com.sample.core.controller.Rodado;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sample.core.service.RodadoService;
import com.sample.core.service.RodadoServiceImp;
import com.sample.core.domain.Rodado;
import com.sample.core.enums.*;

@WebServlet(urlPatterns = "/crearRodado")
public class RodadoController extends HttpServlet {

	private RodadoService rodadoService = new RodadoServiceImp();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. Capturar parámetros (Nombres deben coincidir con el 'name' del <input>)
		String patente = req.getParameter("patente");
		String chasis = req.getParameter("chasis");
		String color = req.getParameter("color");
		String caja = req.getParameter("caja");
		String motor = req.getParameter("motor");
		String tipoEstado = (String) req.getParameter("tipoEstado");
		String tipoConsumo = req.getParameter("tipoConsumo");
		String puertas = req.getParameter("puertas");
		String tipoRodado = req.getParameter("tipoRodado");

		try {
			// 2. Construir el objeto con los Enums
			Rodado nuevoRodado = new Rodado(patente, CajaEnum.valueOf(caja.trim().toUpperCase()), chasis,
					MotorEnum.valueOf(motor.trim().toUpperCase()),
					TipoEstadoEnum.valueOf(tipoEstado.trim().toUpperCase()), color,
					TipoConsumoEnum.valueOf(tipoConsumo.trim().toUpperCase()),
					PuertasEnum.valueOf(puertas.trim().toUpperCase()), null,
					TipoRodadoEnum.valueOf(tipoRodado.trim().toUpperCase()));

			// 3. Guardar
			rodadoService.crearRodado(nuevoRodado);

			// CORRECCIÓN PARA AJAX:
			// En lugar de sendRedirect, enviamos un estado 200 (OK)
			resp.setStatus(HttpServletResponse.SC_OK);
			resp.getWriter().write("Rodado actualizado correctamente");

		} catch (Exception e) {
			e.printStackTrace();
			// Si hay error, enviamos un código 500 y el mensaje de error
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write("Error en el servidor: " + e.getMessage());
		}
	}
}
