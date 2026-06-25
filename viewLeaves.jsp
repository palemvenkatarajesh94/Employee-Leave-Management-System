package com.leave.servlet;

import java.io.IOException;
import java.sql.Date;

import com.leave.dao.LeaveDAO;
import com.leave.model.Leave;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LeaveServlet")
public class LeaveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int empId = Integer.parseInt(request.getParameter("empId"));
        String leaveType = request.getParameter("leaveType");
        Date fromDate = Date.valueOf(request.getParameter("fromDate"));
        Date toDate = Date.valueOf(request.getParameter("toDate"));
        String reason = request.getParameter("reason");

        Leave leave = new Leave();
        leave.setEmpId(empId);
        leave.setLeaveType(leaveType);
        leave.setFromDate(fromDate);
        leave.setToDate(toDate);
        leave.setReason(reason);
        leave.setStatus("Pending");

        LeaveDAO dao = new LeaveDAO();

        if (dao.applyLeave(leave)) {
            response.getWriter().println("Leave Applied Successfully!");
        } else {
            response.getWriter().println("Failed to Apply Leave");
        }
    }
}