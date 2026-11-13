package com.therealyou.therealyou_api;

import org.springframework.boot.SpringApplication;

public class TestTherealyouApiApplication {

	public static void main(String[] args) {
		SpringApplication.from(TherealyouApiApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
