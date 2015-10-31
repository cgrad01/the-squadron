$(document).ready(function() {

  $(".survey_form").on("submit", function(event) {
    event.preventDefault();

    var survey_form = $(".survey_form").serialize();

    var request = $.ajax({
      method: "post",
      url: "/survey",
      data: survey_form,
    })

    request.done(function(survey_form){
      // $(".survey_form").toggle();
      $(".questions").append(survey_form)
    })

  })



  $(".add-choice").on("submit", function(event) {
    event.preventDefault();

    var question_form = $(".question_form").serialize();

    var request = $.ajax({
      method: "post",
      url: "/question",
      data: question_form,
    })

    request.done(function(question_data) {


    })

  })

});
