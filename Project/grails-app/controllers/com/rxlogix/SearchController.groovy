package com.rxlogix

class SearchController {
    def topicService
    def resourcesService

    def index() { }

    def search(){
//        println params.name
        def resources = resourcesService.searchResource(request, params, session.getAttribute("id"))
        def topics = topicService.searchTopic(request, params, session.getAttribute("id"))
        println(topics + "inside search----------------------${params.name}")
        println(resources+ "rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr")
//        println(resources)
        render(view: "search", model: [resources: resources, topicList: topics])
        println("after render")
    }

}
