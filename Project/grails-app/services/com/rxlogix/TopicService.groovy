package com.rxlogix

import com.rxlogix.Enums.VisibilityEnum
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }

    def searchTopic(def request, Map params, Long id){
        User u = User.get(id)
        Set<Long> ut = Subscription.findAllByUser(u).topic.id
        List<Topic> t = Topic.createCriteria().listDistinct {
            ilike("name", "${params.search}%")
            or {
//                inList("ID",ut)
                eq("user", u)
                eq("visibilityEnum", VisibilityEnum.PUBLIC)
            }
        }
        return t
    }
}
