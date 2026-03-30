package com.sample.core.controller.Rodado;

import java.io.IOException;
import java.util.List;

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
import com.sample.core.controller.Rodado.listarRodado;

@WebServlet(urlPatterns = "/listarRodado")
public class listarRodado extends HttpServlet {

	// 1. DECLARARLA ACÁ (Fuera de los métodos)
	// Así es accesible tanto por doGet como por doPost
	private RodadoService rodadoService = new RodadoServiceImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Ya no hace falta declararla acá adentro
			List<Rodado> lista = rodadoService.listarTodos();

			req.setAttribute("listaRodados", lista);
			RequestDispatcher dispatcher = req.getRequestDispatcher(req.getContextPath() + "/Rodado/listarRodado.jsp");
			dispatcher.forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("listarRodado.jsp?status=error_listado");
		}
	}

	

}