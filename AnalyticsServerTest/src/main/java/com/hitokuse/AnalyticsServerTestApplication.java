package com.hitokuse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class AnalyticsServerTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(AnalyticsServerTestApplication.class, args);
	}
	
	/**
     * HiddenHttpMethodFilter  
     */
    @Bean
    public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
        HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
        return filter;
    }
}
