package com.isidroevc.demo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.isidroevc.hibernate.repository.LeadRepository;
import com.isidroevc.hibernate.entity.Lead;
import java.util.List;
@WebServlet(name = "ConnectionServlet", urlPatterns = {"/connection/check"}, loadOnStartup = 1) 
public class ConnectionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Lead user = new Lead("Robb", "Stark", 25);
        LeadRepository leadRepository = new LeadRepository();
        Long id = (Long) leadRepository.createLead(user);
        List<Lead> leads = leadRepository.listAllLeads();
        response.getWriter().print("Connection is up! There are " + leads.size());  
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String name = request.getParameter("name");
        if (name == null) name = "World";
        request.setAttribute("user", name);
        request.getRequestDispatcher("response.jsp").forward(request, response); 
    }
}