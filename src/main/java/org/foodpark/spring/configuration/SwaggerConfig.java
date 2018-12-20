package org.foodpark.spring.configuration;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;

import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {                                    
       
    @Bean
    public Docket api() {   
    	
    	 //Adding Header
        ParameterBuilder aParameterBuilder = new ParameterBuilder();
        aParameterBuilder.name("Authorization")                 // name of header
                         .modelRef(new ModelRef("string"))
                         .parameterType("header")               // type - header
                         .defaultValue("")        // based64 of - zone:mypassword
                         .required(true)                // for compulsory
                         .build();
        List<Parameter> aParameters = new ArrayList<>();
        aParameters.add(aParameterBuilder.build());
    	
        return new Docket(DocumentationType.SWAGGER_2)          
          .select()
          .apis(RequestHandlerSelectors.withClassAnnotation(Controller.class))
          .paths(PathSelectors.any())
          .build()
          .pathMapping("")
          .globalOperationParameters(aParameters);
    }
         
    
    private ApiInfo apiInfo() {
    	ApiInfo apiInfo = new ApiInfo("Food Park", "Application", "1.0", "Terms of service", "info@foodpark.com", "Apache License Version 2.0", null);
        return apiInfo;
    }
}
