package com.rxlogix

class Employee {
    String empName
    int empNumber
    String location

    static hasMany = [departments: Department]
    static belongsTo = Department

    static constraints = {
        empName nullable: false, unique: true
        empNumber nullable: false, unique: true
        location nullable: false
    }
}
