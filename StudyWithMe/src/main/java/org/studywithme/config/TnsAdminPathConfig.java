package org.studywithme.config;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.extern.log4j.Log4j;

@Log4j
@Configuration
public class TnsAdminPathConfig {

	@Bean
	public String tnsAdminPath() throws Exception {
//		String OS = System.getProperty("os.name").toLowerCase();
		/*
		 * if(OS.indexOf("win")>=0) { System.out.println(OS); String basePath =
		 * System.getProperty("user.dir").replace("\\", "\\\\"); Path path =
		 * Paths.get(basePath, "src", "main", "resources", "wallet"); return
		 * path.toAbsolutePath().toString().replace("\\", "\\\\"); }
		 */
		/*
		 * String basePath = System.getProperty("user.dir"); Path path =
		 * Paths.get(basePath, "src", "main", "resources", "wallet"); String resultPath
		 * = path.toAbsolutePath().toString().replace("\\", "/")+"/";
		 * System.out.println("*"); System.out.println("*");
		 * System.out.println(resultPath);
		 */
		
		ClassLoader classLoader = getClass().getClassLoader();
		URL walletUrl = classLoader.getResource("wallet");
		File walletDir = new File(walletUrl.getFile());
		String walletPath = walletDir.getAbsolutePath().replace("\\", "/");
		return walletPath;
	}
}