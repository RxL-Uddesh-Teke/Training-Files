package com.rxlogix

import com.rxlogix.Enums.VisibilityEnum

class Topic {
    String name
//    created by user
//    User user
    Date dateCreated
    Date lastUpdated
    VisibilityEnum visibilityEnum
//    enum visibility

    static belongsTo = [user :User]
    //check mapping for user
    static hasMany = [resources:Resources]

    static constraints = {
        name blank: false
    }

//    List users = User.list()
//
//
//
//
//    List topics =[]
//
//    topics << new Topic(name: "Java Introduction",user: users.get(0))
//    topics << new Topic(name: "Java Core Collections",user: users.get(1))
//    topics << new Topic(name: "Groovy Introduction",user: users.get(2))
//    topics << new Topic(name: "Groovy Collections",user: users.get(0))
//    topics << new Topic(name: "Grails Introduction",user: users.get(3))
//    topics << new Topic(name: "Grails Domain Classes",user: users.get(4))
//    topics << new Topic(name: "GORM",user: users.get(4))
//    topics << new Topic(name: "Grails Controllers",user: users.get(3))
//    topics << new Topic(name: "HTML-CSS",user: users.get(1))
//    topics << new Topic(name: "Javascript & jQuery",user: users.get(2))
//    topics << new Topic(name: "Virtual Box",user: users.get(4))
//    topics << new Topic(name: "Oracle SQL Developer",user: users.get(0))
//
//
//
//    topics.each{ it.save(flush:true,failOnError: true) }
}

