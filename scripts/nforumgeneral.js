$(document).ready(function () {

    // Set this for validation
    $("#mainform").validate({
        errorLabelContainer: $("div.error")
    });

    // Sort the mark as solution button
    $(".marksolution").click(function () {
        var postid = $(this).attr('rel');
        var forumpost = "forumpost" + postid;
        $(".marksolution").remove();
        // Yes this is qualified on the server side, so don't even bother!
        $.get("/base/Solution/MarkAsSolution/" + postid + ".aspx",
        function (data) {
            $('.' + forumpost).removeClass().addClass('forumpost solutionTrue ' + forumpost);
        });
        return false;
    });

    // Sort the thumbs up on a post
    $(".thumbuplink").click(function () {
        var postid = $(this).attr('rel');
        var thumbsholder = "karmathumbs" + postid;
        var karmascore = "karma" + postid;
        $("." + thumbsholder).remove();
        // Yes this is qualified on the server side, so don't even bother!
        $.get("/base/Solution/ThumbsUpPost/" + postid + ".aspx",
        function (data) {
            var newkarma = $('value', data).text();
            $('.' + karmascore).text(newkarma)
        });
        return false;
    });

    // Sort the thumbs up on a post
    $(".thumbdownlink").click(function () {
        var postid = $(this).attr('rel');
        var thumbsholder = "karmathumbs" + postid;
        var karmascore = "karma" + postid;
        $("." + thumbsholder).remove();
        // Yes this is qualified on the server side, so don't even bother!
        $.get("/base/Solution/ThumbsDownPost/" + postid + ".aspx",
        function (data) {
            var newkarma = $('value', data).text();
            $('.' + karmascore).text(newkarma)
        });
        return false;
    });

    // Create a new post
    $(".btnsubmitpost").click(function () {
        var topicid = $(this).attr('rel');
        var sbody = tinyMCE.get('txtPost').getContent();
        $('.topicpostlistnewpost').remove();
        $('.postsuccess').show();
        // Yes this is qualified on the server side, so don't even bother!
        $.post("/base/Solution/NewForumPost/" + topicid + ".aspx",
			   { "postcontent": sbody },
				function (data) {
				    var forceReload = false;
				    forceReload = (window.location.href.indexOf("#") > -1);
				    window.location = jQuery("value", data).text();
				    if (forceReload)
				        window.location.reload()
				});
        return false;
    });

    // Create a new topic
    $(".btnsubmittopic").click(function () {
        var catid = $(this).attr('rel');
        var sbody = tinyMCE.get('txtPost').getContent();
        var stitle = $('#tbTopicTitle').val();
        var sticky = $('#cbSticky').is(':checked');
        $('.createnewtopicform').remove();
        $('.postsuccess').show();
        // Yes this is qualified on the server side, so don't even bother!
        $.post("/base/Solution/NewForumTopic/" + catid + ".aspx",
			   { "postcontent": sbody, "posttitle": stitle, "poststicky": sticky },
				function (data) {
				    var forceReload = false;
				    forceReload = (window.location.href.indexOf("#") > -1);
				    window.location = jQuery("value", data).text();
				    if (forceReload)
				        window.location.reload()
				});
        return false;
    });

    // Subscribe to topic subscribedtotopic
    $(".notsubscribedtotopic").click(function () {
        var topicid = $(this).attr('rel');
        $(this).slideUp('fast');
        $(this).html('Unsubscribe From Topic');
        $(this).removeClass('notsubscribedtotopic').addClass('subscribedtotopic');
        $(this).slideDown();
        $.get("/base/Solution/SubScribeToTopic/" + topicid + ".aspx",
        function (data) {
            var result = $('value', data).text();
        });
        return false;
    });

    // UnSubscribe to topic subscribedtotopic
    $(".subscribedtotopic").click(function () {
        var topicid = $(this).attr('rel');
        $(this).slideUp('fast');
        $(this).html('Subscribe To Topic');
        $(this).removeClass('subscribedtotopic').addClass('notsubscribedtotopic');
        $(this).slideDown();
        $.get("/base/Solution/UnSubScribeToTopic/" + topicid + ".aspx",
        function (data) {
            var result = $('value', data).text();
        });
        return false;
    });

    // UnSubscribe to topic subscribedtotopic
    $(".quotebutton").click(function (event) {
        //event.preventDefault();
        var postid = $(this).attr('rel');
        var postcontentid = "#postcontent" + postid;
        var postmemnameid = ".postmember" + postid;
        var postlink = "#comment" + postid;
        var postmemname = jQuery.trim($(postmemnameid).text());
        var postcontent = "<p><em>In reply To " + postmemname + "</em></p><pre>" + jQuery.trim($(postcontentid).html()) + "</pre>";
        tinyMCE.execCommand('mceInsertContent', false, postcontent);
        return true;
    });

});
