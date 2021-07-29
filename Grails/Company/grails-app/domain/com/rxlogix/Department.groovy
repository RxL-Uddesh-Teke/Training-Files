package com.rxlogix

class Department {
    String departmentName
    int departmentId
    String location

    static hasMany = [employees: Employee]


    static constraints = {
        departmentId nullable: false , unique: true
        departmentName nullable: false, unique: true
        location nullable: false
    }
}
