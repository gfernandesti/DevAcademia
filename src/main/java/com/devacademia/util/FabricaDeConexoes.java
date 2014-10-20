package com.devacademia.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class FabricaDeConexoes {
	
	public static Connection getConnection(){
		
		Connection con=null;
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/academiadev","root","fatec");
                        System.out.println("conectou");
		} catch (SQLException e) {
			System.out.println("Erro no caminho do Banco");
			
		}
		return con;
	}
}
