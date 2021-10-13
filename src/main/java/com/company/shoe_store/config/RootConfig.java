package com.company.shoe_store.config;

import com.company.shoe_store.data.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.PostConstruct;
import java.util.Date;
import java.util.TimeZone;

@Configuration
public class RootConfig {

    private final Logger LOG = LoggerFactory.getLogger(this.getClass());

    //@Autowired
    private UserRepository userRepository;

    // Constructors
    // No-argument constructor
    public RootConfig() {
    }

    // Specialized constructor
    @Autowired
    public RootConfig(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostConstruct
    public void init() {
        // Setting Spring Boot SetTimeZone
        //Log.info("Server TimeZone set to " + TimeZone.getDefault().getDisplayName() + " : " + new Date());
        System.out.println("---> Server TimeZone now is  \t" + TimeZone.getDefault().getDisplayName() + " : " + new Date());
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        System.out.println("---> Server TimeZone set to  \t" + TimeZone.getDefault().getDisplayName() + " : " + new Date());
        TimeZone.setDefault(TimeZone.getTimeZone("CST"));
        System.out.println("---> Server TimeZone back to \t" + TimeZone.getDefault().getDisplayName() + " : " + new Date());

        //Map<String, Object> tz = userDao.queryTimezone();
        //System.out.println("Database global timezone = " + tz.get("globaltz") + " : session = " + tz.get("sessiontz") + " : now = " + tz.get("now"));

        //User user = userDao.findUserById(1);
        //System.out.println("User Create Date = " + user.getCreateDate());
        //SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ");
        //outputFormat.setTimeZone(TimeZone.getTimeZone("CST"));
        //System.out.println(outputFormat.format(user.getCreateDate()));

        // Testing Logging here
        LOG.info("########## This is a Test logging message. ##########");

        LOG.error("########## LOG.error() ##########");
        LOG.warn("########## LOG.warn() ##########");
        LOG.info("########## LOG.info() ##########");
        LOG.debug("########## LOG.debug() ##########");
        LOG.trace("########## LOG.trace() ##########");
    }

    @Bean(name = "propertyConfigurer")
    public static PropertySourcesPlaceholderConfigurer getPropertyPlaceholder() {
        return new PropertySourcesPlaceholderConfigurer();
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(1000000);
        multipartResolver.setPreserveFilename(true);
        return multipartResolver;
    }

}
