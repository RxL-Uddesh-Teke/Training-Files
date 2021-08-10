package com.rxlogix

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class IndexController {
    static scaffold = Index

    IndexService indexService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond indexService.list(params), model:[indexCount: indexService.count()]
    }

    def show(Long id) {
        respond indexService.get(id)
    }

    def create() {
        respond new Index(params)
    }

    def save(Index index) {
        if (index == null) {
            notFound()
            return
        }

        try {
            indexService.save(index)
        } catch (ValidationException e) {
            respond index.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'index.label', default: 'Index'), index.id])
                redirect index
            }
            '*' { respond index, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond indexService.get(id)
    }

    def update(Index index) {
        if (index == null) {
            notFound()
            return
        }

        try {
            indexService.save(index)
        } catch (ValidationException e) {
            respond index.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'index.label', default: 'Index'), index.id])
                redirect index
            }
            '*'{ respond index, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        indexService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'index.label', default: 'Index'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'index.label', default: 'Index'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
