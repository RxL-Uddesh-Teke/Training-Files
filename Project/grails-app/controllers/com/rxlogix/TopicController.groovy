package com.rxlogix

import com.rxlogix.Enums.SeriousnessEnum
import com.rxlogix.Enums.VisibilityEnum
import grails.converters.JSON
import org.hibernate.Session

class TopicController {

    def index() {
        Topic topic = Topic.findByName(params.topic)
        println "${params.value} ------ ${params.topic}"
        render view: 'index', model: [topic: topic]
    }

    def createTopic(){
        println "createTopic called-------------------"
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


        user.addToTopic(t)
        Subscription s = new Subscription(seriousnessEnum: SeriousnessEnum.VERY_SERIOUS, user:  user, topic: t)
        try {
            s.save(flush:true, failOnError: true)
        }catch(Exception e){
            println "Exception"
        }
        return Topic.findAllByUser(User.get(session.getAttribute("id"))) as JSON
    }

//    def getTopic(){
//        return Topic.findAllByUser(User.get(session.getAttribute("id"))) as JSON
//    }

    def changeVisibility(){
        Topic t = Topic.get(params.topic)
        Map mp = ["PRIVATE": VisibilityEnum.PRIVATE, "PUBLIC":VisibilityEnum.PUBLIC]
        t.setProperty("visibilityEnum", mp[params.visibility])
        t.save(flush:true)
    }

    def linkUserAndTopic() {
        User u = User.get(session.getAttribute("id"))
        Topic t = Topic.get(params.topic)
        Subscription check = Subscription.findByTopicAndUser(t, u)
        if (check == null) {
//            u.addToTopic(t)
            Subscription s = new Subscription(seriousnessEnum: SeriousnessEnum.VERY_SERIOUS, user: u, topic: t)
            s.save(flush:true, failOnError: true)
            render "Subscribed to topic: ${t.name}"
        }else{
            render "Already subscribed to this topic"
        }
    }

    def sendInvite(){
        User u = User.findByEmail(params.recipientEmail)
        Topic t = Topic.get(params.topicId)
        String link = "http://localhost:8181"+ createLink(action:"createSub", params: [user: u.id, topic: t.id])
        sendMail {
            to "${u.email}"
            subject "Hello you are invited to private topic:${t.name} " +
                    "On clicking below link you will be subscribed to it."
            text link
        }
        print "Email is sent"
        redirect(controller:"user", action:"userPage")
    }

    def createSub(){
        User u = User.get(params.user)
        Topic t = Topic.get(params.topic)
        Subscription check = Subscription.findByTopicAndUser(t, u)
        if (check == null) {
//            u.addToTopic(t)
            Subscription s = new Subscription(seriousnessEnum: SeriousnessEnum.VERY_SERIOUS, user: u, topic: t)
            s.save(flush:true, failOnError: true)
            render "Subscribed to topic: ${t.name}"
        }else{
            render "Already subscribed to this topic"
        }
    }

}
