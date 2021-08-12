package com.rxlogix

class Token {
    String tokenString

    static belongsTo = [user: User]

    static constraints = {
    }
}
