package com.hitokuse.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@Primary
@MapperScan(
		value = {"com.hitokuse.mappers"}, 
		sqlSessionFactoryRef="baseSqlSessionFactory")
@EnableTransactionManagement
//@PropertySource("file:properties/db.properties")
@PropertySource("classpath:properties/db.properties")
public class DatabaseConfig {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	@Autowired 
	private ApplicationContext applicationContext;
	
	@Primary
	@Bean(name="baseDataSource")
	@ConfigurationProperties(prefix = "spring.datasource.dbcp2")
	public DataSource dataSource() {
		return DataSourceBuilder.create().driverClassName("org.apache.commons.dbcp2.BasicDataSource").build();
	}
	
	@Primary
	@Bean(name="baseSqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("baseDataSource") DataSource dataSource)throws Exception{
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setMapperLocations(applicationContext.getResources("classpath:mappers/*Mapper.xml"));
        sessionFactory.setConfigLocation(applicationContext.getResource("classpath:mybatis/MyBatisConfig.xml"));
        sqlSessionFactory = sessionFactory.getObject();
        return sqlSessionFactory;
    }
	
	public static SqlSessionFactory getSessionFactory() {
		return sqlSessionFactory;
	}
	
	public static SqlSession getSession() {
		SqlSession session = sqlSessionFactory.openSession();
		return session;
	}
}
