package org.studywithme.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.studywithme.mapper.CloudConnectTestMapper;

@RestController
public class CloudConnectTestController {
    @Autowired
    private CloudConnectTestMapper mapper;
    
    @GetMapping("/testconnection")
    public List<String> testDbConnection() {
        return mapper.getAllTableNames();
    }
}