package com.sample.core.controller.Rodado;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sample.core.service.RodadoService;
import com.sample.core.service.RodadoServiceImp;

@WebServlet(urlPatterns = "/eliminarRodado")
public class eliminarRodado extends HttpServlet {

    private RodadoService rodadoService = new RodadoServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String patente = req.getParameter("patente");

        try {
            if (patente != null && !patente.isEmpty()) {
                rodadoService.eliminar(patente);
                // Si tu servlet de listar está en la raíz, esto está bien
                resp.sendRedirect("listarRodado?status=success_delete");
            } else {
                resp.sendRedirect("listarRodado?status=error_patente");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Es buena práctica loguear el error antes de redirigir
            resp.sendRedirect("listarRodado?status=error_eliminar");
        }
    }
}
