package com.rxlogix

class User {
    String email
    String userName
    String password
    String firstName
    String lastName
    String photo
    boolean admin
    Date dateCreated
    Date lastUpdated
    // confirm password check

    // check one to one
//    static hasOne = [resourceRating: ResourceRating]

    static hasMany = [topics:Topic,subscriptions:Subscription,resources:Resources,readingItems:ReadingItem]
//    resourceRating check

    static constraints = {
        email(unique: true, email: true)
        userName(unique: true, blank: false)
        firstName blank: false
        lastName nullable: true
        password blank: false
//        photo type:'blob'
    }

    static mapping = {
        table "USR"
    }
}

