package com.example.springbootgluetn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackageClasses = modelController.class)
public class SpringBootGluetnApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootGluetnApplication.class, args);
	}

}
