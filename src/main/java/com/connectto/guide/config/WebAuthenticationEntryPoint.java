package com.connectto.guide.config;

import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import org.springframework.security.web.AuthenticationEntryPoint;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;

@Component
public class WebAuthenticationEntryPoint implements  AuthenticationEntryPoint, Serializable {

    private static final long serialVersionUID = -8970718410437077606L;

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {
        // This is invoked when user tries to access a secured REST resource without supplying any credentials
        // We should just send a 401 Unauthorized response because there is no 'login page' to redirect to
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
    }

//    @Override
//    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authEx)
//            throws IOException, ServletException {
//        response.addHeader("WWW-Authenticate", "Basic realm=" +getRealmName());
//        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//        PrintWriter writer = response.getWriter();
//        writer.println("HTTP Status 401 - " + authEx.getMessage());
//    }
//
//    @Override
//    public void afterPropertiesSet() throws Exception {
//        setRealmName("DeveloperStack");
//        super.afterPropertiesSet();
//    }
}