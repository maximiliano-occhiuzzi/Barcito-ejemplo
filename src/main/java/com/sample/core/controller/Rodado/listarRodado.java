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

@WebServlet(urlPatterns = "/listarRodado")
public class listarRodado extends HttpServlet {

    private RodadoService rodadoService = new RodadoServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // 1. Obtener la lista
            List<Rodado> lista = rodadoService.listarTodos();

            // 2. Guardar en el request
            req.setAttribute("listaRodados", lista);

            // 3. CAMBIO IMPORTANTE: El dispatcher NO lleva el ContextPath
            // Si tu JSP está en webapp/Rodado/listarRodado.jsp, la ruta es esta:
            RequestDispatcher dispatcher = req.getRequestDispatcher("Rodado/listarRodado.jsp");
            dispatcher.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            // En caso de error de servidor, enviamos el código correspondiente
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar la lista");
        }
    }
}
