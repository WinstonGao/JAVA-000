package org.example.autoconfigure;

import org.example.Example;
import org.example.properties.ExampleProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnProperty(prefix = "spring.example", name = "enabled", havingValue = "true")
@EnableConfigurationProperties(ExampleProperties.class)
public class ExampleAutoConfiguration {
    @Autowired
    private ExampleProperties exampleProperties;

    @Bean
    public Example exampleFactory() {
        if (!this.exampleProperties.isEnabled()) {
            return null;
        }
        return new Example(exampleProperties.getName());
    }
}
