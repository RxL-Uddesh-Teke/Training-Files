package com.rxlogix


class UserController {

    def index(){
        render (view: 'Main_page')
    }
    def action2(){
        render(view: 'loginUser')
    }
    def loginUser(){
        def x = User.findByUserName(params.username);
        if(x!= null){
            if(x.password==params.password){
//                render "Congratulations you are logged in"
                render (action: 'userPage', model: 'params')
            }
            else{
                render "Oops wrong password"
                return
            }
        }
        render "Username doesn't exist"
        return
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
        render(view: 'userPage', model: params)
    }

    def topFive(){
        List<Resources> r = Resources.listOrderByDescription(max: 5)
    }
}
