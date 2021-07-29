package com.rxlogix

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class WebController {
    static scaffold = Web

    WebService webService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond webService.list(params), model:[webCount: webService.count()]
    }

    def show(Long id) {
        respond webService.get(id)
    }

    def create() {
        respond new Web(params)
    }

    def save(Web web) {
        if (web == null) {
            notFound()
            return
        }

        try {
            webService.save(web)
        } catch (ValidationException e) {
            respond web.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'web.label', default: 'Web'), web.id])
                redirect web
            }
            '*' { respond web, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond webService.get(id)
    }

    def update(Web web) {
        if (web == null) {
            notFound()
            return
        }

        try {
            webService.save(web)
        } catch (ValidationException e) {
            respond web.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'web.label', default: 'Web'), web.id])
                redirect web
            }
            '*'{ respond web, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        webService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'web.label', default: 'Web'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'web.label', default: 'Web'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
