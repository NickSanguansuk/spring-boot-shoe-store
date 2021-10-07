package com.company.shoe_store.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableJpaRepositories(basePackages = "com.company.shoe_store.data")
public class DatabaseConfig {

}
