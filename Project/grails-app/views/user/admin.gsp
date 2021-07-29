<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 28/7/21
  Time: 4:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Table 1</title>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
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

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>
</head>

<body>
    <div>
    <h2 style="text-align: center;"> Admin Home </h2>
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
                        <g:form class="form-group" controller="topic" action="createTopic">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Create Topic</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="topicName" class="col-form-label">Name</label>
                                            <input type="text" class="form-control" id="topicName" required>
                                        </div>
                                        <div class="form-group">
                                            %{--<label for="message-text" class="col-form-label">Message:</label>--}%
                                            %{--<textarea class="form-control" id="message-text"></textarea>--}%
                                            <label for="visibility" >Visibility</label>
                                            <select id="visibility" name="time" style="width: 100px;" required>
                                                <option value= 1>PRIVATE</option>
                                                <option value= 0>PUBLIC</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </g:form>
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
                                            <label for="recipient-email" class="col-form-label">Email</label>
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
    <div id="border1">
        <table id="example" class="display" style="width: 100%">
        <thead>
        <tr>
            <th class="th-sm">Name
            </th>
            <th class="th-sm">User Name
            </th>
            <th class="th-sm">Email
            </th>
            <th class="th-sm">Password
            </th>
            <th class="th-sm">Date created
            </th>
        </tr>
        </thead>
        <tbody>
            <g:each in="${user}">
                <tr>
                    <td>${it.firstName} ${it.lastName}</td>
                    <td>${it.userName}</td>
                    <td>${it.email}</td>
                    <td>${it.password}</td>
                    <td>${it.dateCreated}</td>
                </tr>
            </g:each>
        </tbody>
        <tfoot>
            <tr>
                <th class="th-sm">Name
                </th>
                <th class="th-sm">User Name
                </th>
                <th class="th-sm">Email
                </th>
                <th class="th-sm">Password
                </th>
                <th class="th-sm">Date created
                </th>
            </tr>
        </tfoot>
    </table>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>

