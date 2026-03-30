package com.sample.core.controller.Rodado;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sample.core.service.RodadoService;
import com.sample.core.service.RodadoServiceImp;
import com.sample.core.domain.Rodado;
import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.MotorEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoConsumoEnum;
import com.sample.core.enums.TipoEstadoEnum;
import com.sample.core.enums.TipoRodadoEnum;

@WebServlet(urlPatterns = "/crearRodado")
public class RodadoController extends HttpServlet {

	RodadoService RodadoService = new RodadoServiceImp();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String Patente = (String) req.getParameter("patente");
		String Chasis = (String) req.getParameter("chasis");
		String Color = (String) req.getParameter("color");
		String Caja = (String) req.getParameter("caja");
		String Motor = (String) req.getParameter("motor");
		String TipoEstado = (String) req.getParameter("TipoEstado");
		String TipoConsumo = (String) req.getParameter("TipoConsumo");
		String Puertas = (String) req.getParameter("puertas");
		String TipoRodado = (String) req.getParameter("TipoRodado");
		System.out.println("DEBUG - Valor de Caja: [" + Caja + "]");
		try {
			Rodado nuevoRodado = new Rodado(Patente, CajaEnum.valueOf(Caja.trim().toUpperCase()), Chasis,
					MotorEnum.valueOf(Motor.trim().toUpperCase()),
					TipoEstadoEnum.valueOf(TipoEstado.trim().toUpperCase()), Color,
					TipoConsumoEnum.valueOf(TipoConsumo.trim().toUpperCase()),
					PuertasEnum.valueOf(Puertas.trim().toUpperCase()), null, // Si tenés un campo 'id' o similar que sea
																				// nulo/auto
					TipoRodadoEnum.valueOf(TipoRodado.trim().toUpperCase()));

			// 2. Ahora llamás al service pasando el OBJETO completo
			RodadoService.crearRodado(nuevoRodado);
			resp.sendRedirect(req.getContextPath() + "/listarRodado");

		} catch (Exception e) {
			e.printStackTrace();
			// Si hay error, podr�as redirigir con un mensaje de error
			resp.sendRedirect(req.getContextPath() + "/rodadoForm.jsp?status=error");
		}
	}

}
