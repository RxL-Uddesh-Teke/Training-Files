package com.rxlogix

import grails.gorm.services.Service

@Service(Web)
interface WebService {

    Web get(Serializable id)

    List<Web> list(Map args)

    Long count()

    void delete(Serializable id)

    Web save(Web web)

}