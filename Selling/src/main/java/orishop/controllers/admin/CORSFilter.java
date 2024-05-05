package orishop.controllers.admin;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class CORSFilter implements Filter {

    private String allowedOrigins;
    private String allowedMethods;
    private String allowedHeaders;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        allowedOrigins = filterConfig.getInitParameter("allowedOrigins");
        allowedMethods = filterConfig.getInitParameter("allowedMethods");
        allowedHeaders = filterConfig.getInitParameter("allowedHeaders");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        if (allowedOrigins != null && !allowedOrigins.isEmpty()) {
            httpResponse.setHeader("Access-Control-Allow-Origin", allowedOrigins);
        }

        if (allowedMethods != null && !allowedMethods.isEmpty()) {
            httpResponse.setHeader("Access-Control-Allow-Methods", allowedMethods);
        }

        if (allowedHeaders != null && !allowedHeaders.isEmpty()) {
            httpResponse.setHeader("Access-Control-Allow-Headers", allowedHeaders);
        }

        httpResponse.setHeader("Access-Control-Allow-Credentials", "true");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Do nothing
    }
}
