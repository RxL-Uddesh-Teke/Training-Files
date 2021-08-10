package com.rxlogix

class Index {
    String name
    String details
    int value
    Date date

    static hasMany = [webs: Web]

    static constraints = {
        name blank: false, unique: true
        details blank: false
        value nullable: true
    }
}
