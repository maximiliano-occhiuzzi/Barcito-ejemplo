package com.sample.core.service;

import java.util.List;
import com.sample.core.domain.Rodado;
import com.sample.core.dao.RodadoDao;
import com.sample.core.dao.RodadoDaoImp;

public class RodadoServiceImp implements RodadoService {
    
    // Cambié el nombre a minúscula para evitar errores de referencia estática
    private RodadoDao rodadoDao = new RodadoDaoImp();

    @Override
    public List<Rodado> listarTodos() throws Exception {
        // Asegurate que en tu DAO el método se llame igual
        return rodadoDao.listarRodado(); 
    }

    @Override
    public void crearRodado(Rodado rodado) throws Exception {
        // Este es el único que necesitás, el que recibe el OBJETO
        rodadoDao.crearRodado(rodado);
    }

    @Override
    public void actualizar(Rodado rodado) throws Exception {
        rodadoDao.actualizar(rodado);
    }

    @Override
    public void eliminar(String patente) throws Exception {
        rodadoDao.eliminar(patente);
    }

    @Override
    public Rodado buscarPorPatente(String patente) throws Exception {
        return rodadoDao.findByPatente(patente);
    }
}
