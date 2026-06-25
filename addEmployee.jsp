package com.leave.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;
import java.util.ArrayList;

import com.leave.model.Leave;
import com.leave.util.DBConnection;

public class LeaveDAO {

    // Apply Leave
    public boolean applyLeave(Leave leave) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO leaves(emp_id, leave_type, from_date, to_date, reason, status) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, leave.getEmpId());
            ps.setString(2, leave.getLeaveType());
            ps.setDate(3, leave.getFromDate());
            ps.setDate(4, leave.getToDate());
            ps.setString(5, leave.getReason());
            ps.setString(6, leave.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    // View All Leaves (Admin)
    public List<Leave> getAllLeaves() {

        List<Leave> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM leaves";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Leave leave = new Leave();

                leave.setLeaveId(rs.getInt("leave_id"));
                leave.setEmpId(rs.getInt("emp_id"));
                leave.setLeaveType(rs.getString("leave_type"));
                leave.setFromDate(rs.getDate("from_date"));
                leave.setToDate(rs.getDate("to_date"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));

                list.add(leave);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Approve / Reject Leave
    public boolean updateLeaveStatus(int leaveId, String status) {

        boolean result = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "UPDATE leaves SET status=? WHERE leave_id=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, leaveId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // Employee My Leaves
    public List<Leave> getLeavesByEmployee(int empId) {

        List<Leave> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM leaves WHERE emp_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, empId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Leave leave = new Leave();

                leave.setLeaveId(rs.getInt("leave_id"));
                leave.setEmpId(rs.getInt("emp_id"));
                leave.setLeaveType(rs.getString("leave_type"));
                leave.setFromDate(rs.getDate("from_date"));
                leave.setToDate(rs.getDate("to_date"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));

                list.add(leave);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}