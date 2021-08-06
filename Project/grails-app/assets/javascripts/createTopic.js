$(document).ready(function(){
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

}

