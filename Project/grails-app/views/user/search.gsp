<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 28/7/21
  Time: 4:01 PM
--%>

<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 26/7/21
  Time: 8:50 PM
--%>

<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 26/7/21
  Time: 6:20 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing App</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<h2 style="text-align: center;"> Grails Home Page </h2>
<div style="border-color: black;">
    <div class="row" id="div">
        <div class="col-sm-6"><h2>Link Sharing</h2></div>
        <div class="col-sm-6">
            <div class="row" style="float: right;">
                <div>
                    <input type="text" placeholder="Search..">
                    <i class="fa fa-search fa-lg" style="color: black;" aria-hidden="true"></i>
                </div>&nbsp&nbsp
            %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%

                <button type="button" class="btn" data-target="#shareResource" style="width: 40px;" data-toggle="modal"><i class="fa fa-link" aria-hidden="true"></i></button>&nbsp&nbsp
                <div class="modal fade" id="shareResource" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Share Link</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="resource-link" class="col-form-label">Link</label>
                                        <input type="text" class="form-control" id="resource-link" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="description" class="col-form-label">Description</label>
                                        <textarea class="form-control" id="description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        %{--<label for="message-text" class="col-form-label">Message:</label>--}%
                                        %{--<textarea class="form-control" id="message-text"></textarea>--}%
                                        <label for="select-text" >Topic</label>
                                        <select id="select-text" name="time" style="width: 100px;" required>
                                            <option value="topicName1">Groovy</option>
                                            <option value="topicName2">Grails</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Share</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn" data-target="#shareDocument" style="width: 40px;" data-toggle="modal"> <i class="fa fa-file" aria-hidden="true"> </i> </button>&nbsp&nbsp
                <div class="modal fade" id="shareDocument" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Share Document</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="document" class="col-form-label">Document</label>
                                        <input type="file" class="form-control" id="document" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="descriptionDoc" class="col-form-label">Description</label>
                                        <textarea class="form-control" id="descriptionDoc"></textarea>
                                    </div>
                                    <div class="form-group">
                                        %{--<label for="message-text" class="col-form-label">Message:</label>--}%
                                        %{--<textarea class="form-control" id="message-text"></textarea>--}%
                                        <label for="select-text" >Topic</label>
                                        <select id="select-text" name="time" style="width: 100px;" required>
                                            <option value="topicName1">Groovy</option>
                                            <option value="topicName2">Grails</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Share</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "dropdown" style="width: 100px;">
                    <button type = "button" class = "btn btn-secondary dropdown-toggle" data-toggle = "dropdown">user</button>
                    <ul class = "dropdown-menu" >
                        <li><a href = "#" class="dropdown-item">Profile</a></li>
                        <li><a href = "#" class="dropdown-item">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <div class="row">

        <div class="col-sm-5" >
            <div id="border1">
                <div>
                    <p>
                        <b>Topic : "Grails"</b>
                    </p>
                </div><hr>

                <div class="row">
                    <div class="col-sm-4">
                        <img src="https://grails.org/images/grails_logo.svg" style="border-radius: 20%; height: 120px; width: 110px;">
                    </div>
                    <div class="col-sm-8">
                        <a href="#">Grails</a> (private)
                        <hr>
                        <div class="row">
                            <div class="col-sm-4">
                                @rcthomus
                                <a href="#">Subscribe</a>
                            </div>
                            <div class="col-sm-5">
                                Subscriptions
                                <a href="#">50</a>
                            </div>
                            <div class="col-sm-3">
                                Post
                                <a href="#">30</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="border1">
                <div>
                    <p>
                        <b>Users : "Grails"</b>
                    </p>
                </div><hr>
                <div class="row">
                    <img class="col-sm-4" style="border-radius: 20%; height: 120px;" src="data:image/jpeg;base64,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">
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-12">
                                <b>Uddesh Teke</b>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </div>
                            <div class="col-sm-12"><a href="#">@uddesh</a></div><hr>
                            <div class="col-sm-6"><a href="#">Subscriptions</a></div>
                            <div class="col-sm-6"><a href="#">Topics</a></div>
                            <div class="col-sm-6">50</div>
                            <div class="col-sm-6">30</div>

                        </div>
                    </div>
                </div> <hr>

                <div class="row">
                    <img class="col-sm-4" style="border-radius: 20%; height: 120px;" src="data:image/jpeg;base64,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">
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-12">
                                <b>Tony Matt</b>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </div>
                            <div class="col-sm-12"><a href="#">@tony</a></div><hr>
                            <div class="col-sm-6"><a href="#">Subscriptions</a></div>
                            <div class="col-sm-6"><a href="#">Topics</a></div>
                            <div class="col-sm-6">40</div>
                            <div class="col-sm-6">30</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-7">
            <div id="border1">
                <div class="row">
                    <div class="col-sm-6">
                        <p><b>Posts : "Grails"</b></p>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" placeholder="Search..">
                        <button class="btn"><i class="fa fa-search fa-lg" style="color: black;" aria-hidden="true"></i></button>
                    </div>

                </div><hr>

                <div class="row">
                    <div class="col-sm-3">
                        <img src="data:image/png;base64,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" style="border-radius: 20%; height: 120px; width: 110px;">
                    </div>
                    <div class="col-sm-8">
                        Contrary to popular belief, Lorem Ipsum is not simply random
                        text. It has roots in a piece of classical Latin literature from
                        45 BC, making it over 2000 years old.
                        <div class="row">
                            <div class="col-sm-2">
                                <i class="fa fa-facebook" aria-hidden="true"></i>&nbsp&nbsp
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </div>
                            <div class="col-sm-10" style="font-size: small">
                                <a href="#">Download</a>&nbsp&nbsp
                                <a href="#">View Full site</a>&nbsp&nbsp
                                <a href="#">Mark as Read</a>&nbsp&nbsp
                                <a href="#">View Post</a>
                            </div>
                        </div>
                    </div>
                </div> <hr><br>

                <div class="row">
                    <div class="col-sm-3">
                        <img src="data:image/jpeg;base64,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" style="border-radius: 20%; height: 120px; width: 110px;">
                    </div>
                    <div class="col-sm-8">
                        There are many variations of passages of Lorem Ipsum available,
                        but the majority have suffered alteration in some form, by injected humour,
                        or randomised words which don't look even slightly believable.
                        <div class="row">
                            <div class="col-sm-2">
                                <i class="fa fa-facebook" aria-hidden="true"></i>&nbsp&nbsp
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </div>
                            <div class="col-sm-10" style="font-size: small">
                                <a href="#">Download</a>&nbsp&nbsp
                                <a href="#">View Full site</a>&nbsp&nbsp
                                <a href="#">Mark as Read</a>&nbsp&nbsp
                                <a href="#">View Post</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
%{--<-- Always remember to call the above files first before calling the bootstrap.min.js file -->--}%
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>