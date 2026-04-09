package com.sample.core.controller.Rodado;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sample.core.domain.Rodado;
import com.sample.core.service.RodadoService;
import com.sample.core.service.RodadoServiceImp;
import com.sample.core.enums.*; // Importamos todos los Enums

@WebServlet(urlPatterns = "/actualizarRodado")
public class actualizarRodado extends HttpServlet {

    private RodadoService rodadoService = new RodadoServiceImp();

    // 1. Mostrar el formulario con los datos cargados (se activa al hacer clic en "Editar")
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String patente = req.getParameter("patente");
        try {
            Rodado rodado = rodadoService.buscarPorPatente(patente);
            if (rodado != null) {
                req.setAttribute("rodado", rodado);
                // Asegurate que la ruta al JSP sea la correcta según tu proyecto
                req.getRequestDispatcher("/Rodado/editarRodado.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("listarRodado?status=no_encontrado");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("listarRodado?status=error_carga");
        }
    }

    // 2. Procesar el formulario cuando el usuario le da a "Guardar cambios"
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Creamos el objeto con los datos que vienen del formulario (req.getParameter)
            // IMPORTANTE: Los nombres dentro de getParameter deben coincidir con los "name" de tu HTML/JSP
            Rodado rodado = new Rodado();
            
            rodado.setPatente(req.getParameter("patente"));
            rodado.setChasis(req.getParameter("chasis"));
            rodado.setColor(req.getParameter("color"));
            
            // Conversión de Strings a Enums
            rodado.setCaja(CajaEnum.valueOf(req.getParameter("caja")));
            rodado.setMotor(MotorEnum.valueOf(req.getParameter("motor")));
            rodado.setTipoEstado(TipoEstadoEnum.valueOf(req.getParameter("tipoEstado")));
            rodado.setTipoConsumo(TipoConsumoEnum.valueOf(req.getParameter("tipoConsumo")));
            rodado.setPuertas(PuertasEnum.valueOf(req.getParameter("puertas")));
            rodado.setTipoRodado(TipoRodadoEnum.valueOf(req.getParameter("tipoRodado")));

            // Llamamos al service para impactar en la DB
            rodadoService.actualizar(rodado);
            
            // Redirigimos al listado para ver el cambio
            resp.sendRedirect("listarRodado?status=success_update");

        } catch (Exception e) {
            e.printStackTrace();
            // Si falla, volvemos al listado con aviso de error
            resp.sendRedirect("listarRodado?status=error_update");
        }
    }
}
