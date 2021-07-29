package com.rxlogix


class UserController {
    def userService

    def index(){
        render (view: 'Main_page')
    }
    def action2(){
        render(view: 'loginUser')
    }
    def loginUser(){
        def x = User.findByUserName(params.username)
        if(x!= null){
            if(x.password==params.password){
//                render "Congratulations you are logged in"
                redirect(action: "userPage", params:params)
            }
            else{
                render "Oops wrong password"
            }
        }else
        render "Username doesn't exist"
    }

    def register(){
        def x = User.findByUserName(params.username)
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

    def userPage(){
        def user = User.findByUserName(params.username)
        render view: 'userPage', model: [user: user]
    }

    def topFive(){
        List<Resources> r = Resources.listOrderByDescription(max: 5)
    }

    def search(){
        render(view: 'search')
    }

    def admin(){
        def users = User.list();
        render(view: 'admin', model: [user: users])
    }

    def registerUser(){
        String msg = userService.register(request,params)
        if(msg.split(" ")[0] == "Registered"){
            flash.success = msg
        }else{
            flash.error = msg
        }
        redirect(controller: "user", action: "index")
    }
}
