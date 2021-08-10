package com.rxlogix

import org.springframework.web.multipart.MultipartFile

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
            println "Topic name : ${params.topic}----------------------- user :${params.user}, "
        }
        LinkResource l = new LinkResource(url: params.url, resource: r)
        try{
            l.save(flush:true, failOnError:true)
        }catch(Exception e){
            println e
        }
        def userList = Subscription.findAllByTopic(Topic.findByName(params.topic)).user
        userList.each {
            ReadingItem readingItem = new ReadingItem(isRead: false, user: it, resource: r)
            readingItem.save(flush:true, failOnError: true)
        }
        render "${params} saved with ${l}"
    }

    def createDocument(){
//        Resources r = new Resources(description:params.description, user: User.get(session.getAttribute("id")), topic: Topic.findByName(params.topic))
//        try {
//            r.save(flush: true, failOnError: true)
//        }catch(Exception e){
//            println e
//            println "${params.topic}----------------------- ${params.url}"
//        }
//        String msg = resourcesService.createDocument(request, params, r)
//        render msg

            MultipartFile myFile = params.document
            File file = new File("/home/rxlogix/Desktop/TrainingFolders63/Project/grails-app/assets/images/profile/${myFile.originalFilename}")
            myFile.transferTo(file)
            String path = file.getAbsolutePath()
//            User u = session.getAttribute("user")
            User u1 = User.get(session.getAttribute("id"))
            String t = params.get("topic")
            Topic topic = Topic.findByName(t)
            Resources r = new Resources(description:params.description, user: User.get(session.getAttribute("id")), topic: Topic.findByName(params.topic))
            DocumentResource d = new DocumentResource(filePath: path, resource: r)
            r.validate()
            if(r.hasErrors())
            {
                r.errors.allErrors.each {
                    println it
                }
            }
            else{
                r.save(flush:true,failOnError:true)
                topic.addToResources(r)
            }
            d.validate()
            if(d.hasErrors()){
                d.errors.allErrors.each{
                    println it
                }
            }else {
                d.save(flush:true, failOnError: true)

            }
            session.setAttribute("user",u1)
            render "${d} saved in topic ${topic}"


    }
}
