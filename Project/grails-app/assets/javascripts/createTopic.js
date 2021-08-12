$(document).ready(function(){
    // $('#star3').prop("checked", true);
    $("#btn").click(function () {
        // var topicCreate = "${createLink(controller:'topic', action: 'createTopic')}";
        console.log("button clicked");
        $.ajax({
                url:"/topic/createTopic",
                data:{
                    visibility:$("#visibility").val(),
                    topicName :$("#topicName").val()
                },
                success:function (response) {
                    $("#createTopic").modal('hide');
                    console.log("inside success");
                    $("#sendInvite").load(" #sendInvite");
                    // $("#sendInvite").modal('hide');
                    $('#shareDocument').load(' #shareDocument');
                    $('#shareResource').load(' #shareResource');
                    $('#topicList').load(' #topicList');
                },
                error: function (response) {
                    console.log("error");
                }
            }
        )
    });
});

function changeSeriousness(topic) {

    var sr = "#seriousness"+topic;
    var value = $(sr).val();
    alert("Do you want to change seriousness to " + value + " for topic " + topic);
    console.log(sr);
    $.ajax({
        url:"/subscription/changeSeriousness",
        data:{
            seriousness: $(sr).val(),
            topic: topic
        },
        success:function (response) {
            console.log($(sr).val());
            $(sr).val(value);
            $("#trendingTopic").load(" #trendingTopic");
        }
    })
}

function changeVisibility(topic){
    var vs = "#visibility"+topic;
    var value = $(vs).val();
    alert("Do you want to change visibility to "+value+" for topic "+topic);
    $.ajax({
        url:"/topic/changeVisibility",
        data:{
            visibility: $(vs).val(),
            topic: topic
        },
        success:function (response) {
            console.log("inside success");
            $("#topicList").load(" #topicList");
            $("#trendingTopic").load(" #trendingTopic");
        }
    })
}

function search() {
    var input = $("#search").val();
    // console.log("Inside search");
    console.log(input);
    $.ajax({
        url:"/search/search",
        data:{
            name: input
        },
        success:function (response) {
            console.log("--------success");
            // console.log(response)
            $("#topicSearch").load(" #topicSearch");
            console.log("topicsearch loaded")
        }
    })
}

function readTrue(readItem){
    $.ajax({
        url:"/user/markAsRead",
        data:{
            id:readItem
        },
        success:function (response) {
            $("#readItems").load(" #readItems");
        }
    })
}

function deleteTopic(topic){
    alert("Do you really want to delete this topic?");
    $.ajax({
        url:"/topic/deleteTopic",
        data:{
            id:topic
        },
        success:function (response) {
            console.log("Inside success");
            $("#topicList").load(" #topicList");
        }
    })
}

function rate(score, resourceId) {
    console.log(score);
    var id = "#star" + score;
    $.ajax({
        url:"/resources/addRating",
        data:{
            score: score,
            resourceId: resourceId
        },
        success:function (response) {
            console.log("Inside rating success");
            $(id).addClass("checked");
        }
    })
}

function rating(id){
    var Id = "#star" + id;
    $(Id).prop("checked", true);
    console.log("called rating with score:"+ id);
}

