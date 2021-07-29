package com.rxlogix

import grails.gorm.services.Service

@Service(Index)
interface IndexService {

    Index get(Serializable id)

    List<Index> list(Map args)

    Long count()

    void delete(Serializable id)

    Index save(Index index)

}