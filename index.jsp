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

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get session
        HttpSession session = request.getSession(false);

        // Check session
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get employee object
        Employee emp = (Employee) session.getAttribute("employee");

        // Check employee object
        if (emp == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        EmployeeDAO dao = new EmployeeDAO();

        boolean status = dao.changePassword(
                emp.getEmpId(),
                oldPassword,
                newPassword);

        if (status) {
            response.getWriter().println(
                    "Password Changed Successfully");
        } else {
            response.getWriter().println(
                    "Old Password Incorrect");
        }
    }
}