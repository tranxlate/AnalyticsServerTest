package com.hitokuse.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;

import lombok.Data;

@Configuration
@PropertySource("classpath:properties/app.properties")
//@PropertySource("file:properties/app.server.properties")
@ConfigurationProperties(prefix="app")
@Primary
@Data
public class AppServerConfig {
	
}
