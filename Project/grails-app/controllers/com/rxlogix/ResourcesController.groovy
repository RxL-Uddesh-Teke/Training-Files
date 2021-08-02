package com.rxlogix

class ResourcesController {
    def resourcesService

    def index() {
        render(view: 'index')
    }

    def createLink(){
        Resources r = new Resources(description:params.description, user: User.get(session.getAttribute("id")), topic: Topic.findByName(params.topic))
        try {
            r.save(flush: true, failOnError: true)
        }catch(Exception e){
            println e
            println "${params.topic}----------------------- ${params.url}"
        }
        LinkResource l = new LinkResource(url: params.url, resource: r)
        try{
            l.save(flush:true, failOnError:true)
        }catch(Exception e){
            println e
        }

        render "${params} saved with ${l}"
    }

    def createDocument(){
        Resources r = new Resources(description:params.description, user: User.get(session.getAttribute("id")), topic: Topic.findByName(params.topic))
        try {
            r.save(flush: true, failOnError: true)
        }catch(Exception e){
            println e
            println "${params.topic}----------------------- ${params.url}"
        }
        String msg = resourcesService.createDocument(request, params, r)
        render msg
    }
}