package com.rxlogix

class Resources {
    String description
//    created by user
//    topic
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user :User,topic:Topic]

    static constraints = {
    }
}

