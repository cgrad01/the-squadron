$(document).ready(function() {

  $(document).on("click", ".delete-choice", function(){
    event.preventDefault();
    $target=$(event.target)
    var choiceId = $target.attr("href").slice(9)

    var request = $.ajax({
      method: "post",
      url: "/choices/"+ choiceId,
      data: $(this).serialize()
    });

    request.done(function(){
      $target.parent().parent().remove()
    });

    request.fail(function(jsXHR){
      console.log(jsXHR.responseText)
      console.log("fail")
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




});
