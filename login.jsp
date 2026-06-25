package com.leave.servlet;

import java.io.IOException;

import com.leave.dao.EmployeeDAO;
import com.leave.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/employeeLogin")
public class EmployeeLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        EmployeeDAO dao = new EmployeeDAO();

        Employee emp = dao.login(email, password);

        if (emp != null) {

            HttpSession session = request.getSession();
            session.setAttribute("employee", emp);
            response.sendRedirect("employeeDashboard.jsp");
            

        } else {

            response.getWriter()
                    .println("Invalid Email or Password");
        }
    }
}