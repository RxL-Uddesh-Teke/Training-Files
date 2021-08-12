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
    %{--<link rel="stylesheet" href="/assets/stylesheets/bootstrap.css">--}%
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <asset:javascript src="createTopic.js"/>
    <style >
    *{
        margin: 0;
        padding: 0;
    }
    .rate {
        float: left;
        height: 46px;
        padding: 0 10px;
    }
    .rate:not(:checked) > input {
        position:absolute;
        top:-9999px;
    }
    .rate:not(:checked) > label {
        float:right;
        width:1em;
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:30px;
        color:#ccc;
    }
    .rate:not(:checked) > label:before {
        content: '★ ';
    }
    .rate > input:checked ~ label {
        color: #ffc700;
    }
    .rate:not(:checked) > label:hover,
    .rate:not(:checked) > label:hover ~ label {
        color: #deb217;
    }
    .rate > input:checked + label:hover,
    .rate > input:checked + label:hover ~ label,
    .rate > input:checked ~ label:hover,
    .rate > input:checked ~ label:hover ~ label,
    .rate > label:hover ~ input:checked ~ label {
        color: #c59b08;
    }

    #div{
        /*color: blue;*/
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
<body>
    <div class="container">
        <h2 style="text-align: center;"> Home </h2>
        <div style="border-color: black;">
            <div class="row" id="div">
                <div class="col-sm-6"><h2 style="color: blue;">Link Sharing</h2></div>
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
    </div>

    <div class="container">
        <div class="row">

            <div class="col-sm-7" >
                <div id="border1">
                    <div class="row">
                        <div class="col-sm-3"><img src="https://static.xx.fbcdn.net/rsrc.php/y8/r/dF5SId3UHWd.svg" style="border-radius: 20%; height: 120px; width: 110px;"></div>
                        <div class="col-sm-3"><b>${resource.user.firstName} <a href="#">@${resource.user.userName}</a></b></div>
                        <div class="col-sm-2" style="float: right=;"> <a href="#">${resource.topic.name}</a></div>
                        <div class="col-sm-4">
                            <div class="rate">
                                <input type="radio" id="star5" name="rate" value="5" onclick="rate(5)" />
                                <label for="star5" title="text">5 stars</label>
                                <input type="radio" id="star4" name="rate" value="4" onclick="rate(4)"/>
                                <label for="star4" title="text">4 stars</label>
                                <input type="radio" id="star3" name="rate" value="3" onclick="rate(3)"/>
                                <label for="star3" title="text">3 stars</label>
                                <input type="radio" id="star2" name="rate" value="2" onclick="rate(2)"/>
                                <label for="star2" title="text">2 stars</label>
                                <input type="radio" id="star1" name="rate" value="1" onclick="rate(1)"/>
                                <label for="star1" title="text">1 star</label>
                            </div>
                        </div>
                    </div>
                    <p>${resource.description}</p>
                    <div class="row">
                        <div class="col-sm-4">
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </div>
                        <div class="col-sm-8">
                            <a href="#">Delete</a>&nbsp&nbsp
                            <a href="#">Edit</a>&nbsp&nbsp
                            <a href="#">Download</a>&nbsp&nbsp
                            <a href="#">View Full site</a>
                    </div>
                </div>
                </div>
            </div>

            <div class="col-sm-5">
                <div class="row" id="border1">

                    <div><b>Trending Topics</b></div>
                    <br><hr>

                    <div class="row">
                        <div class="col-sm-3"><img src="https://static.xx.fbcdn.net/rsrc.php/y8/r/dF5SId3UHWd.svg" style="border-radius: 20%; height: 120px; width: 110px;">
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-8">
                            <b><a href="#">Grails</a></b>
                            <div class="row">
                                <div class="col-sm-4"><p>@uddesh</p></div>
                                <div class="col-sm-5"> Subscriptions</div>
                                <div class="col-sm-3">Post</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4"><a href="#">Unsubscribe</a></div>
                                <div class="col-sm-5" style="float: right;"> <a href="#">50</a></div>
                                <div class="col-sm-3"><a href="#">30</a></div>
                            </div>
                        </div>
                    </div> <hr>

                    <div class="row">
                        <div class="col-sm-3"><img src="https://static.xx.fbcdn.net/rsrc.php/y8/r/dF5SId3UHWd.svg" style="border-radius: 20%; height: 120px; width: 110px;">
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-8">
                            <b><a href="#">Groovy</a></b>
                            <div class="row">
                                <div class="col-sm-4"><p>@uddesh</p></div>
                                <div class="col-sm-5"> Subscriptions</div>
                                <div class="col-sm-3">Post</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4"><a href="#">Unsubscribe</a></div>
                                <div class="col-sm-5" style="float: right;"> <a href="#">200</a></div>
                                <div class="col-sm-3"><a href="#">40</a></div>
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