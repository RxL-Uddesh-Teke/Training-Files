<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 23/7/21
  Time: 10:01 AM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing App</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style >

    #div{
        /*color: blue;*/
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: black;
        /*width: 100%;*/
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
<body  class="container">
<div>
    <h2 style="text-align: center;"> Home </h2>
    <div style="border-color: black;">
        <div class="row" id="div">
            <div class="col-sm-5"><h2 style="color: blue">Link Sharing</h2></div>
            <div class="col-sm-7">
                <div class="row">
                    <div class="col-sm-6">
                        <i class="fa fa-search" aria-hidden="true" style="color:black;"></i>
                        <input type="text" placeholder="Search..">
                    </div>
                        <button type="button" class="btn" data-target="#createTopic" data-toggle="modal"><i class="fa fa-comment" aria-hidden="true"></i></button>&nbsp&nbsp
                        <div class="modal fade" id="createTopic" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Create Topic</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Name</label>
                                                <input type="text" class="form-control" id="recipient-name" required>
                                            </div>
                                            <div class="form-group">
                                                %{--<label for="message-text" class="col-form-label">Message:</label>--}%
                                                %{--<textarea class="form-control" id="message-text"></textarea>--}%
                                                <label for="select-text" >Visibility</label>
                                                <select id="select-text" name="time" style="width: 100px;" required>
                                                    <option value="private">Private</option>
                                                    <option value="public">Public</option>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">Save</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <button type="button" class="btn"  data-target="#sendInvite" data-toggle="modal"><i class="fa fa-envelope-o" aria-hidden="true"></i></button>&nbsp&nbsp
                        <div class="modal fade" id="sendInvite" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Send Invite</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Email</label>
                                                <input type="text" class="form-control" id="recipient-email" required>
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
                                        <button type="button" class="btn btn-primary">Invite</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn"  data-target="#shareResource" data-toggle="modal"><i class="fa fa-link" aria-hidden="true"></i></button>&nbsp&nbsp
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
                        <button type="button" class="btn"  data-target="#shareDocument" data-toggle="modal"><i class="fa fa-file" aria-hidden="true"></i></button>&nbsp&nbsp
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
                        <div class = "dropdown">
                            <button type = "button" class = "btn btn-secondary dropdown-toggle" data-toggle = "dropdown" >user</button>
                            <ul class = "dropdown-menu" >
                                <li><a href = "#" class="dropdown-item">Profile</a></li>
                                <li><a href = "#" class="dropdown-item">Users</a></li>
                                <li><a href = "#" class="dropdown-item">Topics</a></li>
                                <li><a href = "#" class="dropdown-item">Posts</a></li>
                                <li><a href = "#" class="dropdown-item">Logout</a></li>
                            </ul>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="row" >
        <div class="col-sm-5">
                <div id="border1">
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
                    </div>
                </div>
                <div id="border1">
                    <b>Subscriptions</b>
                    <a href="#" style="float: right;">View All</a>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <img src="https://grails.org/images/grails_logo.svg" style="border-radius: 20%; height: 120px; width: 110px;">
                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-9"><b><a href="#">Grails</a> </b></div>
                            </div>
                            <hr>
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
                        <div class="col-sm-3">
                            <img src="data:image/png;base64,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" style="border-radius: 20%; height: 120px; width: 110px;">
                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-9"><b><a href="#">Groovy</a> </b></div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-4"><p>@anna</p></div>
                                <div class="col-sm-5"> Subscriptions</div>
                                <div class="col-sm-3">Post</div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4"><a href="#">Unsubscribe</a></div>
                                <div class="col-sm-5" style="float: right;"> <a href="#">200</a></div>
                                <div class="col-sm-3"><a href="#">30</a></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        <div class="col-sm-7" >
            <div id="border1">
                <b>Inbox</b><hr>
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-3">
                            <img src="https://www.lamborghini.com/sites/it-en/files/themes/custom/lambo_facelift_2019/images/logo.png" style="border-radius: 20%; height: 120px; width: 110px;">
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
                            <img src="https://www.starbucks.in/media/logo_tcm87-366_w1024_n.png" style="border-radius: 20%; height: 120px; width: 110px;">
                            %{--<g:assetPath src="profile_3.jpeg"> </g:assetPath>--}%
                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-9"><b>Mike <a href="#">@mike</a></b></div>
                                <div class="col-sm-3"> <a href="#">Grails</a></div>
                            </div>
                            <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. </p>
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