package com.rxlogix

import com.rxlogix.Enums.SeriousnessEnum

class Subscription {
//    topic
//    user
//    enum seriousness
    SeriousnessEnum seriousnessEnum
    Date dateCreated

    static belongsTo = [topic:Topic,user:User]

    static constraints = {
    }
}
