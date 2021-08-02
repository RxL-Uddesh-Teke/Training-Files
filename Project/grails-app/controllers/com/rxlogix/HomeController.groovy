package com.rxlogix

class HomeController {

    def index() {
        redirect(controller: "user", action:"index")
    }


}
