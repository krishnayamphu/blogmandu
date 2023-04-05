package com.ky.listeners;

import com.ky.database.Database;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Database.run();
        ServletContext context=sce.getServletContext();
        String rootPath="/blogmandu";
        context.setAttribute("rootPath",rootPath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Database.destroy();
    }
}
