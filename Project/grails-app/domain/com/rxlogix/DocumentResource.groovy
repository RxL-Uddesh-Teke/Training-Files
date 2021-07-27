package com.rxlogix

class DocumentResource {
    String filePath

    static belongsTo = [resource: Resources]

    static constraints = {
        filePath blank: false
    }

    static mapping = {
        table 'DocRes'
    }
}
