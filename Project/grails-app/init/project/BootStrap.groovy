package project

import com.rxlogix.Topic
import com.rxlogix.User
import com.rxlogix.Subscription
import com.rxlogix.Enums.SeriousnessEnum
import com.rxlogix.Enums.VisibilityEnum

class BootStrap {

    def init = { servletContext ->
        createUser()
        createTopic()
        createSubs()
    }
    def createUser(){
        User u1 = new User(firstName: "bhupender",lastName: "singh",username: "bhuppi",password: "abcd",confirmPassword: "abcd"
                ,mailid: "bhuppi@gmail.com",admin:"false",active: "true",photo: "/avatars/bhuppi.png")
        User u2 = new User(firstName: "pranjal",lastName: "negi",username: "pranjal",password: "abcd",confirmPassword: "abcd"
                ,mailid: "pranjal@gmail.com",admin:"false",active: "true",photo: "/avatars/pranjal.png")
        User u3 = new User(firstName: "rachit",lastName: "goel",username: "rachit",password: "abcd",confirmPassword: "abcd"
                ,mailid: "rachit@gmail.com",admin:"false",active: "true")
        User u4 = new User(firstName: "ankit",lastName: "vat",username: "ankit",password: "1234",confirmPassword: "1234"
                ,mailid: "ankit@gmail.com",admin:"false",active: "true")
        u1.save(flush:true)
        u2.save(flush:true)
        u3.save(flush:true)
        u4.save(flush:true)
    }
    def createTopic(){
        List<String> l=["Grails","Java","Groovy","Spring","HTML","CSS","JavaScript","MySQL","Servlets"
                        ,"Linux","Git","Bootstrap","JQuery","C++","Python","Big-data","Machine Learning",
                        "Ms Excel","R","C"]
        int i=0
        if(Topic.count==0){
            User.list().each{
                user-> (1..5).each {
                    it ->
                        if(i%5==0)
                        {
                            Topic t= new Topic(name: "${l[i]}", createdBy: user, visibility: VisibilityEnum.PRIVATE)
                            t.validate()
                            if (t.hasErrors())
                            {
                                t.errors.allErrors.each {
                                    println it
                                }
                            }
                            else
                            {
                                t.save(flush:true)
                                user.addToTopics(t)
                            }
                        }
                        else
                        {
                            Topic t=new Topic(name: "${l[i]}", createdBy: user, visibility: VisibilityEnum.PUBLIC)
                            t.validate()
                            if (t.hasErrors())
                            {
                                t.errors.allErrors.each {
                                    println it
                                }
                            }
                            else
                            {
                                t.save(flush:true)
                                user.addToTopics(t)
                            }
                        }
                        i++
                }
            }
        }
    }
    def createSubs(){
        User.list().each{
            User u-> Topic.list().each{
                Topic t->
                    if(t.createdBy==u)
                    {
                        Subscription s = new Subscription(user: u, topic: t, seriousness: SeriousnessEnum.SERIOUS)
                        s.validate()
                        if (s.hasErrors())
                        {
                            s.errors.allErrors.each {
                                println it
                            }
                        }
                        else
                        {
                            s.save(flush:true)
                            t.addToSubscriptions(s)
                            u.addToSubscriptions(s)
                        }
                    }
            }

        }
        List<User> u = User.list()
        List<Topic> t = Topic.list()
        for(int i=0;i<User.list().size();i++)
        {
            for(int j=0;j<Topic.list().size();j=j+4)
            {
                if(t[j].createdBy!=u[i])
                {
                    Subscription s1 = new Subscription(user: u[i],topic: t[j],seriousness:  SeriousnessEnum.SERIOUS)
                    s1.save(flush:true)
                }
            }
        }
    }
    def destroy = {
    }
}
