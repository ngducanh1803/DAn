package com.tmp.config.configuration;

import com.google.common.collect.ImmutableList;
import com.tmp.config.security.JWTAuthenticationFilter;
import com.tmp.config.security.JWTAuthorizationFilter;
import com.tmp.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Component;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

@Component
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private IUserService service;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(service).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors().and()
                .authorizeRequests()
                .antMatchers("/api/v1/login").anonymous()
                .antMatchers("/api/v1/loaitours/**").permitAll()
                .antMatchers("/api/v1/tours/**").permitAll()
                .antMatchers("/api/v1/hangs/**").permitAll()
                .antMatchers("/api/v1/phieuAdmins/**").permitAll()
                .antMatchers("/api/v1/toursAdmin/**").permitAll()
                .antMatchers("/api/v1/tinhs/**").permitAll()
                .antMatchers("/api/v1/hoaDons/**").permitAll()
                .antMatchers("/api/v1/chiTietToursAdmin/**").permitAll()
                .antMatchers("/api/v1/chitiet/**").permitAll()
                .antMatchers("/api/v1/tintuc/**").permitAll()

//                .antMatchers("/api/v1/groups/**").hasAnyAuthority("Admin","Manager")
                .anyRequest().authenticated()
                .and()
                .httpBasic()
                .and()
                .csrf().disable()
                .addFilterBefore(
                        JWTAuthenticationFilter(),
                        UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(
                        JWTAuthorizationFilter(),
                        UsernamePasswordAuthenticationFilter.class);
    }


    @Bean
    public JWTAuthenticationFilter JWTAuthenticationFilter() throws Exception {
        return new JWTAuthenticationFilter("/api/v1/login", authenticationManager());
    }

    @Bean
    public JWTAuthorizationFilter JWTAuthorizationFilter() {
        return new JWTAuthorizationFilter();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        final CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedMethods(ImmutableList.of("HEAD", "GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"));
        configuration.applyPermitDefaultValues();

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}