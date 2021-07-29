package com.rxlogix

import grails.gorm.transactions.Transactional
@Transactional
class UserService {
    def serviceMethod() {
    }
    def register(def request, Map params){
        if(params.password != params.cnf_password){
//          redirect back with error msg
            return "Passwords don't match, Please try again..."
        }else{
            User newUser = new User(params)
            def file = request.getFile('image')
            if (file && !file.empty) {
                File photo = new File("/home/rxlogix/IdeaProjects/LinkSharing/grails-app/assets/images/avatars/${params.userName}.jpg")
                file.transferTo(photo)
                newUser.photo = file
                //"/profile/${params.userName}.jpg"
            }
            try {
//              redirect back with success msg
                newUser.save(flush:true,failOnError:true)
                return "Registered Successfully, Please Login to continue..."
            }catch(Exception e) {
//              redirect back with error msg
                return "Error in registering, Please try again..."
            }
        }
    }
}