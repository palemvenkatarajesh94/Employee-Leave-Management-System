package com.leave.servlet;

import java.io.IOException;

import com.leave.dao.EmployeeDAO;
import com.leave.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addEmployee")
public class EmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String empName = request.getParameter("empName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String department = request.getParameter("department");

        Employee emp = new Employee();

        emp.setEmpName(empName);
        emp.setEmail(email);
        emp.setPassword(password);
        emp.setDepartment(department);

        EmployeeDAO dao = new EmployeeDAO();

        if (dao.addEmployee(emp)) {

            response.getWriter().println(
                    "<h2 style='color:green;'>Employee Added Successfully!</h2>");

        } else {

            response.getWriter().println(
                    "<h2 style='color:red;'>Failed to Add Employee</h2>");
        }
    }
}