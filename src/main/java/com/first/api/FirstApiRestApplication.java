package com.first.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class FirstApiRestApplication {
// code code codeeeeeeeeeeeeeeeeeeeee test
	public static void main(String[] args) {

		try {
			SpringApplication.run(FirstApiRestApplication.class, args);
			System.out.println("Se inicia la App para integracion continua CI");
		} catch (Exception e) {
		
			System.out.println("Error al iniciar la aplicacion: " + e.getMessage());
		}
		
	}

}
