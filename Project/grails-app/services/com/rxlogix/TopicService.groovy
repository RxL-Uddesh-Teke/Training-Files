package com.rxlogix

import com.rxlogix.Enums.VisibilityEnum
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }

    def searchTopic(def request, Map params, Long id){
        User u = User.get(id)
        List<Integer> ut = Subscription.findAllByUser(u).topic.id
        List<Topic> t = Topic.createCriteria().listDistinct {
//            or {
//                eq("visibilityEnum", VisibilityEnum.PUBLIC)
//                'in'("id", ut)
//            }
            ilike("name", "${params.search}%")
        }
        return t
    }
}
