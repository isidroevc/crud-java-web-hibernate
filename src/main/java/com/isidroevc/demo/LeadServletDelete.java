package com.isidroevc.demo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.isidroevc.hibernate.repository.LeadRepository;
import com.isidroevc.hibernate.entity.Lead;

@WebServlet(name = "LeadServletDelete", urlPatterns = {"/delete"}, loadOnStartup = 1) 
public class LeadServletDelete extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String textId = request.getParameter("id");
        System.out.println(textId);
        LeadRepository leadRepository = new LeadRepository();
        leadRepository.deleteLead(Long.parseLong(textId));
        request.getRequestDispatcher("index.jsp").forward(request, response); 
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        LeadRepository leadRepository = new LeadRepository();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String ageText = request.getParameter("age");
        int age = Integer.parseInt(ageText);
        Lead lead = new Lead(firstName, lastName, age);
        Long id = (Long) leadRepository.createLead(lead);
        request.getRequestDispatcher("index.jsp").forward(request, response); 
    }
}