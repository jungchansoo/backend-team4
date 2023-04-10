package org.studywithme.config;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TnsAdminPathConfig {

	@Bean
	public String tnsAdminPath() throws Exception {
		String basePath = System.getProperty("user.dir").replace("\\", "/");
		System.out.println(basePath);
		Path path = Paths.get(basePath, "src", "main", "resources", "wallet");
		System.out.println("***");
		System.out.println("***");
		System.out.println("***");
		System.out.println(path);
		return path.toAbsolutePath().toString().replace("\\", "/");
	}
}