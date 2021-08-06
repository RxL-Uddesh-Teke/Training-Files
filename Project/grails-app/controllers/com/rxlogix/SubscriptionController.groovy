package com.rxlogix

import com.rxlogix.Enums.SeriousnessEnum

class SubscriptionController {

    def index() { }

    def changeSeriousness(){
        Topic t = Topic.get(params.topic)
        User u = User.get(session.getAttribute("id"))
        println "inside controller"
        try{
            Subscription s = Subscription.findByTopicAndUser(t,u)
            Map map = ["VERY_SERIOUS": SeriousnessEnum.VERY_SERIOUS, "SERIOUS":SeriousnessEnum.SERIOUS, "CASUAL":SeriousnessEnum.CASUAL]
            SeriousnessEnum seriousnessEnum = map[params.seriousness]
            println "${u}:user -------- ${s}:subscription ------- ${params.seriousness}:seriousness--------- ${t}:topic"
            s.setProperty("seriousnessEnum",seriousnessEnum)
            s.save(flush:true)
            println "${s.seriousnessEnum}   ${s}"
            if(s==null){
                render "You are subscribed to this topic, remove functionality"
            }
        }catch(Exception e){
            println(e)
        }
        return "ok"
    }
}
