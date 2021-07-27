<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 22/7/21
  Time: 9:33 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing App</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style >
    #div{
        color: blue;
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: black;
        width: 100%;
        padding: 10px;
        margin: 5px;
    }
    #border1{
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: black;
        padding: 10px;
        margin: 5px;
    }
    </style>
</head>
<body class="container">
<div>
    <h2 style="text-align: center;"> Home </h2>
    <div style="border-color: black;">
        <div class="row" id="div">
            <div class="col-sm-9"><h2>Link Sharing</h2></div>
            <div class="col-sm-3">
                <i class="fa fa-search" aria-hidden="true" style="color:black;"></i>
                <input type="text" placeholder="Search..">
            </div>
        </div>
    </div>
</div>

<div>
    <div class="row">
        <div  class="col-sm-6">
            <div id="border1">
                <b >Recent Shares</b><hr>
                <div class="row">
                    <div class="col-sm-3">
                        <img src="data:image/jpeg;base64,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" style="border-radius: 20%; height: 120px; width: 110px;">
                    </div>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-9"><b>Anna Gunn <a href="#">@anna</a></b></div>
                            <div class="col-sm-3"> <a href="#">Grails</a></div>
                        </div>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>
                        <div class="row">
                            <div class="col-sm-8">
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </div>
                            <div class="col-sm-4"><a href="#">View Post</a></div>
                        </div>

                    </div>
                </div> <hr>

                <div class="row">
                    <div class="col-sm-3">
                        <img src="project/grails-app/assets/images/skin/profile_3.jpeg" style="border-radius: 20%; height: 120px; width: 110px;">
                    </div>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-9"><b>Walter White <a href="#">@heisenburg</a></b></div>
                            <div class="col-sm-3"> <a href="#">Grails</a></div>
                        </div>
                        <p>You clearly don’t know who you’re talking to, so let me clue you in. I am not in danger, Skyler. I am the danger. </p>
                        <div class="row">
                            <div class="col-sm-8">
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </div>
                            <div class="col-sm-4"><a href="#">View Post</a></div>
                        </div>

                    </div>
                </div>
            </div>
            <div>
                <div class="row" id="border1">
                    <div class="col-sm-8">
                        <b>Top posts</b>
                    </div>
                    <div class="col-sm-4">
                        <i class="fa fa-chevron-circle-down" aria-hidden="true"></i>
                        <select id="cars" name="cars">
                            <option value="Today">Today</option>
                            <option value="Week">1 Week</option>
                            <option value="Month">1 Month</option>
                            <option value="Year">1 Year</option>
                        </select>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <img src="project/grails-app/assets/images/skin/profile_3.jpeg" style="border-radius: 20%; height: 120px; width: 110px;">
                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-9"><b>Walter White <a href="#">@heisenburg</a></b></div>
                                <div class="col-sm-3"> <a href="#">Grails</a></div>
                            </div>
                            <p>You clearly don’t know who you’re talking to, so let me clue you in. I am not in danger, Skyler. I am the danger. </p>
                            <div class="row">
                                <div class="col-sm-8">
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </div>
                                <div class="col-sm-4"><a href="#">View Post</a></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="col-sm-12" id="border1">
                <g:form controller="user" action="loginUser">
                    <label><b>Log In</b></label><hr>
                    <div>
                        <label for="username"><b>Username</b></label>&nbsp
                        <input type="text" placeholder="Enter Username" name="username" required><br><br>

                        <label for="password"><b>Password</b></label>&nbsp
                        <input type="password" placeholder="Enter Password" name="password" required><br><br>

                        <button type="submit">Login</button>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                    </div>

                    <div style="background-color:#f1f1f1">
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                        <span class="psw">Forgot <a href="#">password?</a></span>
                    </div>
                </g:form>
            </div>

            <div class="col-sm-12" id="border1">
                <g:form class="form-group" controller="user" action="register">
                    <div>
                        <label bold><b>Sign Up</b></label>&nbsp
                        <p>Please fill in this form to create an account.</p><hr>
                        <label for="email"><b>Email</b></label>&nbsp
                        <input type="text" placeholder="Enter Email" name="email" required><br><br>

                        <label for="userName"><b>User Name</b></label>&nbsp
                        <input type="text" placeholder="Enter User Name" name="userName" required><br><br>

                        <label for="firstName"><b>first Name</b></label>&nbsp
                        <input type="text" placeholder="Enter first Name" name="firstName" required><br><br>

                        <label for="lastName"><b>last Name</b></label>&nbsp
                        <input type="text" placeholder="Enter last Name" name="lastName" required><br><br>

                        <label for="password"><b>Password</b></label>&nbsp
                        <input type="password" placeholder="Enter Password" name="password" required><br><br>

                        <label for="psw-repeat"><b>Repeat Password</b></label>&nbsp
                        <input type="password" placeholder="Repeat Password" name="psw-repeat" required><br><br>

                        <label>
                            <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
                        </label>

                        <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

                        <div class="clearfix">
                            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                            <button type="submit" class="signupbtn">Sign Up</button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>

    </div>

</div>
</body>
</html>