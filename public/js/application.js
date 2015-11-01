
$(document).ready(function() {

  $(document).on("click", ".delete-choice", function(){
    event.preventDefault();
    var $target = $(event.target);
    var choiceId = $target.attr("href").slice(9)

    var request = $.ajax({
      method: "post",
      url: "/choices/"+ choiceId,
    });

    request.done(function(){
      $target.parent().parent().remove();
    });

    request.fail(function(jsXHR){
      console.log(jsXHR.responseText);
      console.log("fail");
    });

  });

  $(document).on("click", ".delete-question", function(){
    event.preventDefault();
    $target = $(event.target)
    var questionId = $target.attr("href").slice(11)

    var request = $.ajax({
      method: "post",
      url: "/questions/" + questionId
    });

    request.done(function(){
      $target.parent().parent().remove();
      console.log(done);
    });

    request.fail(function(jsXHR){
      console.log("fail");
      console.log(jsXHR.responseText);
    });

  });

  $(document).on("click", ".create-survey", function(){
    event.preventDefault();
    var $target = $(event.target);
    // $("#content").toggle();
    var request = $.ajax({
      method: "get",
      url: "/surveys/new"
    });

    request.done(function(response){
    $("#content").replaceWith(response);
    });

    request.fail(function(jsXHR){
      console.log("fail")
    })
  });

  $(document).on("click", ".new-survey-page .make-survey", function(){
    event.preventDefault();
    var $target = $(event.target);
    var surveyName = $(".survey-form .survey-name").val();


    var request = $.ajax({
      method: "post",
      url: "/surveys/new",
      data: {"title": surveyName}
    })

    request.done(function(response){
      surveyName;
      $(".survey-title").text(surveyName)
      $(".survey-form").hide()
      $(".questions-container").append(response)
      console.log(response)
    });

     request.fail(function(){
      console.log("fail")
      console.log(jsXHR.responseText)
    });

  });

  $(document).on("click", ".add-question", function(){
    event.preventDefault();
    var $target = $(event.target);
    var questionContent = $(".add-q").val();


    var request = $.ajax({
      method: "post",
      url: "/questions/new",
      data: {"question": questionContent}
    })

    request.done(function(response){
      console.log(response);
    });

    request.fail(function(jsXHR){
      console.log("fail");
      console.log(jsXHR.responseText);
    });

  });


});

