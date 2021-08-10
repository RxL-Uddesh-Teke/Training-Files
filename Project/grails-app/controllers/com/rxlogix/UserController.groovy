package com.rxlogix

import com.rxlogix.Enums.VisibilityEnum
import org.hibernate.criterion.Projection


class UserController {
    def userService

    def index(){
        render (view: 'Main_page')
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

//    def search(){
//        Topic t = Topic.createCriteria().list {
//
//        }
//        render(view: 'search')
//    }

    def admin(){
        def users = userService.userList()
        render(view: 'admin', model: [user: users])
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
}
