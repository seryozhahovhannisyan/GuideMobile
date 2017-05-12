package com.connectto.guide.config;


import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.Properties;

/**
 * Hikari Connection Pool configuration.
 */
@SuppressWarnings("ALL")
@Configuration
public class DataSourceConfig {
    private static final String HIKARICP_CLOSE_METHOD = "close";

    @Bean(destroyMethod = HIKARICP_CLOSE_METHOD)
    DataSource dataSource(Environment env) {
        // initializing CP
        HikariConfig dataSourceConfig = new HikariConfig();

        // Applying configuration properties
//        dataSourceConfig.setDriverClassName(env.getRequiredProperty("spring.datasource.driverClassName"));
//        dataSourceConfig.setJdbcUrl(env.getRequiredProperty("spring.datasource.url"));
//        dataSourceConfig.setUsername(env.getRequiredProperty("spring.datasource.username"));
//        dataSourceConfig.setPassword(env.getRequiredProperty("spring.datasource.password"));
//        dataSourceConfig.setMaximumPoolSize(Integer.parseInt(env.getRequiredProperty("spring.datasource.maximumPoolSize")));
//
        //
        dataSourceConfig.setPoolName(env.getRequiredProperty("spring.datasource.poolName"));
        dataSourceConfig.setConnectionTestQuery(env.getRequiredProperty("spring.datasource.validation-query"));
        dataSourceConfig.setDataSourceClassName(env.getRequiredProperty("spring.datasource.dataSourceClassName"));
        dataSourceConfig.setMinimumIdle(Integer.parseInt(env.getRequiredProperty("spring.datasource.minimumIdle")));
        dataSourceConfig.setMaximumPoolSize(Integer.parseInt(env.getRequiredProperty("spring.datasource.maximumPoolSize")));
        dataSourceConfig.setConnectionTimeout(Integer.parseInt(env.getRequiredProperty("spring.datasource.connectionTimeout")));
        dataSourceConfig.setMaxLifetime(Integer.parseInt(env.getRequiredProperty("spring.datasource.maxLifetime")));

        //start Properties
        Properties dataSourceProperties = new Properties();
        dataSourceProperties.put("url", env.getRequiredProperty("spring.datasource.url"));
        dataSourceProperties.put("user", env.getRequiredProperty("spring.datasource.username"));
        dataSourceProperties.put("password", env.getRequiredProperty("spring.datasource.password"));
        dataSourceProperties.put("cachePrepStmts", env.getRequiredProperty("spring.datasource.cachePrepStmts"));
        dataSourceProperties.put("prepStmtCacheSize", env.getRequiredProperty("spring.datasource.prepStmtCacheSize"));
        dataSourceProperties.put("prepStmtCacheSqlLimit", env.getRequiredProperty("spring.datasource.prepStmtCacheSqlLimit"));
        dataSourceProperties.put("useServerPrepStmts", env.getRequiredProperty("spring.datasource.useServerPrepStmts"));
        //end Properties
        dataSourceConfig.setDataSourceProperties(dataSourceProperties);
        // returning instantiated bean
        return new HikariDataSource(dataSourceConfig);
    }

    /**
     * The method that configures the entity manager factory
     */
    @Bean
    LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource, Environment env) {
        LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        entityManagerFactoryBean.setDataSource(dataSource);
        entityManagerFactoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        entityManagerFactoryBean.setPackagesToScan("com.connectto.guide.entity");

        Properties jpaProperties = new Properties();

        jpaProperties.put("hibernate.dialect", env.getRequiredProperty("spring.jpa.hibernate.dialect"));
        jpaProperties.put("hibernate.hbm2ddl.auto", env.getRequiredProperty("spring.jpa.hibernate.ddl-auto"));
        jpaProperties.put("hibernate.show_sql", env.getRequiredProperty("spring.jpa.hibernate.show-sql"));
//        jpaProperties.put("hibernate.format_sql", env.getRequiredProperty("spring.jpa.hibernate.format_sql"));

        entityManagerFactoryBean.setJpaProperties(jpaProperties);

        return entityManagerFactoryBean;
    }

    /**
     * The method that configures the transaction manager
     */
    @Bean
    JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory);
        return transactionManager;
    }

}