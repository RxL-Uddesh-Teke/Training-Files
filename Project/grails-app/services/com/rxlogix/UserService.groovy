package com.rxlogix

import grails.gorm.transactions.Transactional
import org.hibernate.criterion.Projection

@Transactional
class UserService {
    def serviceMethod() {
    }
    def update(def request, Map params, Integer id){
        String msg = ""
        User u = User.get(id)
        if(params.firstName!=""&&params.firstName!=null){
            u.firstName = params.firstName
            msg += "firstName:${params.firstName} \n"
        }
        if(params.lastName!=""&&params.lastName!=null) {
            u.lastName = params.lastName
            msg += "lastName:${params.lastName} \n "
        }
        if(params.userName!=""&&params.userName!=null){
            u.userName = params.userName
            msg += "userName:${params.userName} \n "
        }
        if(params.password!=""&&params.password!=null){
            u.password = params.password
            msg += "password:${params.password} \n "
        }

        if(params.photo!=null){
            def file = request.getFile('image')
            if(file && !file.empty) {
                File photo = new File("/home/rxlogix/Desktop/TrainingFolders63/Project/grails-app/assets/images/profile/${u.id}.jpg")
                file.transferTo(photo)
                u.photo = "/profile/${u.id}.jpg"
                msg += "photo "
            }
        }
        msg += "Updated"
        return msg
    }

    def register(def request, Map params){
        if(params.password != params.psw_repeat){
//          redirect back with error msg
            return "Passwords don't match, Please try again..."
        }else{
            if(User.findByEmail(params.email)!=null){
                return "Email Already Exist"
            }else if (User.findByUserName(params.userName) != null){
                return "Username not available, try different one"
            }
            User newUser = new User(params)
            def file = request.getFile('image')
            if (file && !file.empty) {
                File photo = new File("/home/rxlogix/Desktop/TrainingFolders63/Project/grails-app/assets/images/profile/${newUser.userName}.jpg")
                file.transferTo(photo)
                newUser.photo = "/profile/${newUser.userName}.jpg"
                newUser.active= true
                //"/profile/${params.userName}.jpg"
//                newUser = User(params, photo:"${photo.getAbsolutePath()}")
//                println newUser.photo
            }
//            newUser.save(flush:true,failOnError:true)
            try {
//              redirect back with success msg
                newUser.save(flush:true,failOnError:true)
                if(newUser.id==1){
                    newUser.setAdmin(true)
                    newUser.save(flush:true)
                }
                return "Registered Successfully, Please Login to continue..."
            }catch(Exception e) {
//              redirect back with error msg
                print(e)
                return "Error in registering, Please try again..."
            }
        }
    }

    def login(def request, Map params){
        def x = User.findByUserName(params.username)
        if(x!= null&&x.active){
            if(x.password==params.password){
                return "Congratulations you are logged in"
//                redirect(action: "userPage", params:params)
            }
            else{
                return "Oops wrong password"
            }
        }else if(x==null){
            return "Username doesn't exist"
        }else if(!x.active){
            return "You are deactivated by admin"
        }

    }

    def logout(){
//        int x = User.createCriteria(){
//            projection{
//                avg("")
//            }
//        }
        return User.list().lastName.unique()
    }

    def userList(){
        return User.list()
    }

    def activate(){

    }

    def deactivate(){

    }
}