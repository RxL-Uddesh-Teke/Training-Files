package com.rxlogix

class LinkResource {
    String url

    static belongsTo = [resource: Resources]
    //comment

    static constraints = {
        url blank: false
    }

    static mapping = {
        table 'LinkRes'
    }
}
