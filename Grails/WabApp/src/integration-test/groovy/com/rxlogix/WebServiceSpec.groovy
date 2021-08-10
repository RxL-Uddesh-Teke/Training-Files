package com.rxlogix

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class WebServiceSpec extends Specification {

    WebService webService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Web(...).save(flush: true, failOnError: true)
        //new Web(...).save(flush: true, failOnError: true)
        //Web web = new Web(...).save(flush: true, failOnError: true)
        //new Web(...).save(flush: true, failOnError: true)
        //new Web(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //web.id
    }

    void "test get"() {
        setupData()

        expect:
        webService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Web> webList = webService.list(max: 2, offset: 2)

        then:
        webList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        webService.count() == 5
    }

    void "test delete"() {
        Long webId = setupData()

        expect:
        webService.count() == 5

        when:
        webService.delete(webId)
        sessionFactory.currentSession.flush()

        then:
        webService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Web web = new Web()
        webService.save(web)

        then:
        web.id != null
    }
}
