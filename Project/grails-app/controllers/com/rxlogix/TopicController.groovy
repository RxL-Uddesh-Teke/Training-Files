package com.rxlogix

import com.rxlogix.Enums.VisibilityEnum
import org.hibernate.Session

class TopicController {

    def index() {
        render(view: 'index')
    }

    def createTopic(){
//        def VIS = (params.visibiliy=="1")?VisibilityEnum.PUBLIC:VisibilityEnum.PRIVATE
//        Topic t = new Topic(name: params.name, visibilityEnum: VIS)
//        if(t.hasErrors()){
//            println "The value ${t.errors.getFieldError('visibilityEnum')}"
//        }

        render "${params.topicName} successfully created: visibility ${params.visibility}"
//        t.save(flush:true, failOnError: true)
    }
}
