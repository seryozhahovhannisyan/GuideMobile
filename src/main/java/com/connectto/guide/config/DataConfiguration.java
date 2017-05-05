package com.connectto.guide.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Created by Seryozha on 4/30/16.
 */
@Configuration
@EnableJpaRepositories(basePackages = {"com.connectto.guide.repository"}, entityManagerFactoryRef = "entityManagerFactory", transactionManagerRef = "transactionManager")
@EnableTransactionManagement
public class DataConfiguration {


}