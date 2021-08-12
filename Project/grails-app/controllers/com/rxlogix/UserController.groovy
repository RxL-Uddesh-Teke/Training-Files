package com.rxlogix

import com.rxlogix.Enums.VisibilityEnum
import org.hibernate.criterion.Projection


class UserController {
    def userService

    def index(){
        List<Resources> resources = Resources.listOrderByDateCreated(max: 5)
        List<ResourceRating> ratingList = ResourceRating.listOrderByScore(max: 5,order:"asc")
        render (view: 'Main_page', model: [resources: resources, ratings: ratingList])
    }

    def logout(){
        session.invalidate()
        redirect(action: index())
    }
    def action2(){
        render(view: 'loginUser', model: [user: user])
    }
    def loginUser(){
//        def x = User.findByUserName(params.username)
//        if(x!= null){
//            if(x.password==params.password){
////                render "Congratulations you are logged in"
//                redirect(action: "userPage", params:params)
//            }
//            else{
//                render "Oops wrong password"
//            }
//        }else
//        render "Username doesn't exist"

        String msg = userService.login(request, params)
        if(msg.split(" ")[0] == "Congratulations"){
            flash.success = msg
            session.setAttribute('id', User.findByUserName(params.username).getId())
            redirect(action:"userPage", params:params)
        }else {
//            flash.error = msg
            render msg
        }
    }

    def register(){
        def x = User.findByUserName(params.userName)
        def y = User.findByEmail(params.email)
        if(x==null&&y==null){
            User u = new User(params)
            u.save(flush:true, failOnError: true)
            render "user successfully registered, login to your account"
        }else if(x!=null){
            render "user name already exist"
            return
        }else{
            render "Use another Email"
            return
        }
    }

    def userPage() {
        def user = User.findById(session.getAttribute("id"))
        List<Topic> trendingTopics = Topic.createCriteria().list {
            eq("visibilityEnum", VisibilityEnum.PUBLIC)
//            or {
//                eq("visibilityEnum", VisibilityEnum.PRIVATE)
//                Subscription.findAllByUser(User.get(session.getAttribute("id"))).topic
//            }
        }
        List<ReadingItem> readingItemList = ReadingItem.createCriteria().list {
            eq("user", user)
            eq("isRead", false)
        }
        List<Subscription> subs = Subscription.findAllByUser(User.get(session.getAttribute("id")))
        render view: 'userPage', model: [user: user, trendingTopics: trendingTopics, subs:subs, readItem: readingItemList]
    }

    def topFive(){
        List<Resources> r = Resources.listOrderByDescription(max: 5)
    }

//    def recentShare(){
//        List<Resources> resources = Resources.listOrderByDateCreated(max: 5)
//    }

//    def search(){
//        Topic t = Topic.createCriteria().list {
//
//        }
//        render(view: 'search')
//    }

    def admin(){
        def users = userService.userList()
        if(User.get(session.getAttribute("id")).admin){
            render(view: 'admin', model: [user: users])
        }else{
            render "You are not admin"
        }

    }

    def registerUser(){
        String msg = userService.register(request,params)
        if(msg.split(" ")[0] == "Registered"){
            flash.success = msg
//            redirect(action: securityQuestion(),params: params)
        }else{
            flash.error = msg
        }
        render msg
    }

    def securityQuestion(){
        print("Inside securityQuestion acion")
        User u = User.findByUserName(params.userName)
        render(view: "securityQuestion", model: u)
    }



    def uniqueLast(){
        def msg = userService.logout();
        render msg
    }

    def editUserProfile(){
        User user = User.get(session.getAttribute('id'))
        render (view: 'editUserProfile', model: [user: user])
    }

    def editUser(){
        Integer id = session.getAttribute("id");
        String msg = userService.update(request, params, id)
        render msg
    }

    def markAsRead(){
        ReadingItem r = ReadingItem.get(params.id)
        r.setProperty("isRead", true)
        r.save(flush:true)
    }

    def activateUser(){
        User u = User.get(params.id)
        u.setActive(true)
        u.save(flush:true)
        render "${u.userName} successfully activated"
    }
    def deactivateUser(){
        User u = User.get(params.id)
        if (!u.admin){
            u.setActive(false)
            u.save(flush:true)
            render "${u.userName} successfully deactivated"
        }else{
            render "You are admin, you cannot deactivate yourself"
        }
    }

    def forgotPassword(){
        println("forgot password called")
        String t = Math.random()
        User u = User.findByEmail(params.email)
        if(u==null){
            render "Account with following email doesnt exist"
        }else{
            Token token = new Token(user: u, tokenString: t)
            token.save(flush:true, failOnError: true)
            println "token saved By ${token}"
            String link = "http://localhost:8181"+ createLink(action: "renderForgotPassword", params: [user: u.id, tokenString: t])
            sendMail {
                to "${params.email}"
                subject "${u.userName}:Link for reset password"
                text link
            }
            render "Email should be sent"
        }
    }

    def renderForgotPassword(){
        println "${params.tokenString} from email--------------"
        Token tokenDelete = Token.findByTokenString(params.tokenString)
        if(tokenDelete!=null){
            String tok = Token.findByTokenString(params.tokenString).tokenString

            println "${tok} from server-----------------------"
            println "${params.tokenString==tok}"
            tokenDelete.delete(flush: true)
            println  "${tokenDelete}--------------tokenDelete"
            render (view: "forgotPassword", model: [user:params.user])
        }else{
            render " Invalid Token"
        }

    }

    def changePassword(){
        println "change password called from gsp page"
        if(params.password==params.cnfpassword){
            User u = User.get(params.user)
            u.password = params.password
            u.save(flush:true)
            render"Password changed successfully"
        }
    }
}
