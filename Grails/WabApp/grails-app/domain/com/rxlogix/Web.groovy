package com.rxlogix

class Web {
    String name

    static hasMany = [indexs : Index]
    static belongsTo = Index

    static constraints = {
        name blank: false, unique: true
    }
}
