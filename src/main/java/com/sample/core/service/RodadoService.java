package com.sample.core.service;

import java.util.List;

import com.sample.core.domain.Rodado;
import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.MotorEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoConsumoEnum;
import com.sample.core.enums.TipoEstadoEnum;
import com.sample.core.enums.TipoRodadoEnum;

public interface RodadoService {

    // Para llenar tu tabla en el JSP
    public List<Rodado> listarTodos() throws Exception;

    // Para procesar el formulario de creación
    public void crearRodado(Rodado rodado) throws Exception;

    // Para procesar cambios
    public void actualizar(Rodado rodado) throws Exception;

    // Para borrar, solo necesitas la clave primaria
    public void eliminar(String patente) throws Exception;
    
    // Tip: Te falta uno para buscar por patente (útil para editar)
    public Rodado buscarPorPatente(String patente) throws Exception;
}
