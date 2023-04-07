package org.studywithme.config;

import static org.junit.Assert.assertNotNull;

import java.nio.file.Path;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class TnsAdminPathConfigTest {

	@Autowired
	private String tnsAdminPath;

	@Test
	public void testTnsAdminPath() {
		
//		assertNotNull(tnsAdminPath, "TNS_ADMIN path should not be null.");
		 
		System.out.println("TNS_ADMIN path: " + tnsAdminPath);
	}
}