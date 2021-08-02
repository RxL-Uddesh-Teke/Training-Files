package com.rxlogix

import com.rxlogix.Enums.SeriousnessEnum
import com.rxlogix.Enums.VisibilityEnum
import org.hibernate.Session

class TopicController {

    def index() {
        render(view: 'index')
    }

    def createTopic(){
        def VIS = (params.visibility=="0")?VisibilityEnum.PUBLIC:VisibilityEnum.PRIVATE
        Integer u = session.getAttribute('id')
        User user = User.get(u)
        Topic t = new Topic(name: params.topicName, visibilityEnum: VIS, user: user)
        //try catch
        try{
            t.save(flush:true, failOnError: true)
        }catch(Exception e){
            println "${params.topicName} + ${VIS} + ${params.visibility}"
            println e
        }


        user.addToTopics(t)
        Subscription s = new Subscription(seriousnessEnum: SeriousnessEnum.VERY_SERIOUS, user:  user, topic: t)
        try {
            s.save(flush:true, failOnError: true)
        }catch(Exception e){
            println "Exception"
        }

//        if(t.hasErrors()){
//            println "The value ${t.errors.getFieldError('visibilityEnum')}"
//        }

        render "${params.topicName} successfully created: visibility ${params.visibility}, ${VIS}, ${session.getAttribute("id")}"
//        t.save(flush:true, failOnError: true)
    }
}
