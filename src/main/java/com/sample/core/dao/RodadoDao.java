package com.sample.core.dao;

import java.util.List;
import com.sample.core.domain.Rodado;
import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.MotorEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoConsumoEnum;
import com.sample.core.enums.TipoEstadoEnum;
import com.sample.core.enums.TipoRodadoEnum;

public interface RodadoDao {
    // Buscar uno solo
    public Rodado findByPatente(String patente) throws Exception;

    // Traer la lista completa (para tu tabla JSP)
    public List<Rodado> listarRodado() throws Exception;

    // Crear uno nuevo (o podés llamarlo guardar)
    public void crearRodado(Rodado rodado) throws Exception;

    // Modificar uno existente
    public void actualizar(Rodado rodado) throws Exception;

    // Borrar por su clave primaria
    public void eliminar(String patente) throws Exception;
}

