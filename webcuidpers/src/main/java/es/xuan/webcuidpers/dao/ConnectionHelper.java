package es.xuan.webcuidpers.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionHelper
{
	public static Connection getConnection() throws SQLException {
		// usuario y clave
		String user = "root";
		String password = "Miquel_01";
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// se envía la cadena y los datos de usuario y password por separado
			Properties datos = new Properties();
			datos.put("user", user);
			datos.put("password", password);
			String url = "jdbc:mysql://juanje-pc:3306/cuidpersbbdd";
			connection = DriverManager.getConnection(url, datos);
			if (connection != null) {
				System.out.println("Conexión: Conexión satisfactoria");
			}		
		} catch (SQLException e) {
			throw e;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public static void close(Connection connection)
	{
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}