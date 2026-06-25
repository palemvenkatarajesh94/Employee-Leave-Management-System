package com.leave.model;

public class Employee {

    private int empId;
    private String empName;
    private String email;
    private String password;
    private String department;

    public Employee() {
    }

    public Employee(int empId, String empName, String email,
                    String password, String department) {

        this.empId = empId;
        this.empName = empName;
        this.email = email;
        this.password = password;
        this.department = department;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}