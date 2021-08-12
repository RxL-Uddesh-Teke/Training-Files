package com.rxlogix

class ResourceController {

    def index() {
        Resources r = Resources.get(params.id)
        render(view: 'index', model: [resource: r])
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

    }
}
