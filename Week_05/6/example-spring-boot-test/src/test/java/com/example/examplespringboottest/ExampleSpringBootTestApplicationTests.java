package com.example.examplespringboottest;

import org.example.Example;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(properties = "test")
class ExampleSpringBootTestApplicationTests {

    @Autowired
    private Example example;

    @Test
    void contextLoads() {
        System.out.println(example.getName());
    }



}
