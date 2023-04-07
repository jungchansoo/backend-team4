package org.studywithme.controller;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class URLtest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/root-context.xml");
        DriverManagerDataSource dataSource = context.getBean("dataSource", DriverManagerDataSource.class);

        System.out.println("URL: " + dataSource.getUrl());
    }
}