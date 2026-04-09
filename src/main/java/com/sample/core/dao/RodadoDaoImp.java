package com.sample.core.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sample.core.dao.config.Conexion;
import com.sample.core.domain.Rodado;
import com.sample.core.enums.CajaEnum;
import com.sample.core.enums.MotorEnum;
import com.sample.core.enums.PuertasEnum;
import com.sample.core.enums.TipoConsumoEnum;
import com.sample.core.enums.TipoEstadoEnum;
import com.sample.core.enums.TipoRodadoEnum;

public class RodadoDaoImp implements RodadoDao {

	private Conexion conexion = Conexion.getInstance();

	@Override
	public void crearRodado(Rodado rodado) throws Exception {
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conexion.dameConnection().createStatement();
			int result = st.executeUpdate(
					"INSERT INTO rodado (patente, chasis, color, caja, motor, tipo_estado, tipo_consumo, puertas, tipo_rodado) VALUES "
							+ "('" + rodado.getPatente() + "', " + "'" + rodado.getChasis() + "', " + "'"
							+ rodado.getColor() + "', " + "'" + rodado.getCaja().name() + "', " + "'"
							+ rodado.getMotor().name() + "', " + "'" + rodado.getTipoEstado().name() + "', " + "'"
							+ rodado.getTipoConsumo().name() + "', " + "'" + rodado.getPuertas().name() + "', " + "'"
							+ rodado.getTipoRodado().name() + "')");
			if (result == 0) {
				throw new Exception("No se inserto el registro");
			}

		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			finalizarConexion(st, rs);
		}

	}

	@Override
	public Rodado findByPatente(String patente) throws Exception {
	    Rodado r = null;
	    Statement st = null;
	    ResultSet rs = null;

	    try {
	        st = conexion.dameConnection().createStatement();
	        rs = st.executeQuery("SELECT * FROM rodado WHERE patente = '" + patente + "'");

	        if (rs.next()) {
	            // Mapeamos los datos de la base de datos al objeto Rodado
	            r = new Rodado(
	                rs.getString("patente"), 
	                CajaEnum.valueOf(rs.getString("caja")),
	                rs.getString("chasis"), 
	                MotorEnum.valueOf(rs.getString("motor")),
	                TipoEstadoEnum.valueOf(rs.getString("tipo_estado")), 
	                rs.getString("color"),
	                TipoConsumoEnum.valueOf(rs.getString("tipo_consumo")),
	                PuertasEnum.valueOf(rs.getString("puertas")), 
	                null, // Id si existe
	                TipoRodadoEnum.valueOf(rs.getString("tipo_rodado"))
	            );
	        }
	    } catch (Exception e) {
	        System.out.println("Error en DAO al buscar por patente: " + e.getMessage());
	        throw new Exception("Error al obtener el rodado: " + e.getMessage());
	    } finally {
	        finalizarConexion(st, rs);
	    }
	    return r;
	}


	@Override
	public List<Rodado> listarRodado() throws Exception {
		List<Rodado> lista = new ArrayList<>();
		Statement st = null;
		ResultSet rs = null;

		try {
			// Usamos tu objeto de conexión igual que en crearRodado
			st = conexion.dameConnection().createStatement();
			rs = st.executeQuery("SELECT * FROM rodado");

			while (rs.next()) {
				// Creamos el objeto usando los nombres de columna de tu DB
				// Si no tenés un constructor vacío, usá el que recibe todo
				Rodado r = new Rodado(rs.getString("patente"), CajaEnum.valueOf(rs.getString("caja")),
						rs.getString("chasis"), MotorEnum.valueOf(rs.getString("motor")),
						TipoEstadoEnum.valueOf(rs.getString("tipo_estado")), rs.getString("color"),
						TipoConsumoEnum.valueOf(rs.getString("tipo_consumo")),
						PuertasEnum.valueOf(rs.getString("puertas")), null, // Id si existe
						TipoRodadoEnum.valueOf(rs.getString("tipo_rodado")));
				lista.add(r);
			}
		} catch (Exception e) {
			System.out.println("Error en DAO al listar: " + e.getMessage());
			throw new Exception("Error al obtener la lista de rodados: " + e.getMessage());
		} finally {
			// Usamos tu método de cierre para no dejar conexiones abiertas
			finalizarConexion(st, rs);
		}
		return lista;
	}
	@Override
	public void actualizar(Rodado rodado) throws Exception {
	    Statement st = null;
	    try {
	        st = conexion.dameConnection().createStatement();
	        String sql = "UPDATE rodado SET "
	                + "chasis = '" + rodado.getChasis() + "', "
	                + "color = '" + rodado.getColor() + "', "
	                + "caja = '" + rodado.getCaja().name() + "', "
	                + "motor = '" + rodado.getMotor().name() + "', "
	                + "tipo_estado = '" + rodado.getTipoEstado().name() + "', "
	                + "tipo_consumo = '" + rodado.getTipoConsumo().name() + "', "
	                + "puertas = '" + rodado.getPuertas().name() + "', "
	                + "tipo_rodado = '" + rodado.getTipoRodado().name() + "' "
	                + "WHERE patente = '" + rodado.getPatente() + "'";
	        
	        int result = st.executeUpdate(sql);
	        if (result == 0) {
	            throw new Exception("No se encontr� el rodado con patente " + rodado.getPatente() + " para actualizar.");
	        }
	    } catch (Exception e) {
	        throw new Exception("Error al actualizar: " + e.getMessage());
	    } finally {
	        finalizarConexion(st, null);
	    }
	}

	@Override
	public void eliminar(String patente) throws Exception {
	    Statement st = null;
	    try {
	        st = conexion.dameConnection().createStatement();
	        int result = st.executeUpdate("DELETE FROM rodado WHERE patente = '" + patente + "'");
	        
	        if (result == 0) {
	            throw new Exception("No se encontr� el rodado con patente " + patente + " para eliminar.");
	        }
	    } catch (Exception e) {
	        throw new Exception("Error al eliminar: " + e.getMessage());
	    } finally {
	        finalizarConexion(st, null);
	    }
	}

	private void finalizarConexion(Statement st, ResultSet rs) {
		try {
			if (st != null) {
				st.close();
			}
			if (rs != null) { // Esta validaci�n evita el NullPointerException
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println("Error al cerrar recursos: " + e.getMessage());
		}
	}

}
