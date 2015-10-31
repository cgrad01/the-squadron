// $(document).ready(function() {

// Add more questions to survey
  // $(document).on("click", ".next_question", function(event){
  //   event.preventDefault();

  //   // var question_form = $(".question_form").serialize();

  //   var request = $.ajax({
  //     method: "post",
  //     url: "/question",
  //     // data: question_form,
  //   })

  //   request.done(function(question_form) {

  //     $(".questions").append(question_form)
  //   })

  // })

// Adds more choices to first question
  // $(document).on("submit", ".choice_form", function(event) {
  //   event.preventDefault();

  //   var choice_form = $(".choice_form").serialize();

  //   var request = $.ajax({
  //     method: "post",
  //     url: "/choice",
  //     data: choice_form,
  //   })

  //   request.done(function(choice_data) {
  //     $(".choices").append(choice_data)

  //   })
  // })

// Adds first choice to first question
  // $(document).on("submit", ".question_form", function(event) {

  //   event.preventDefault();

  //   var question_form = $(".question_form").serialize();

  //   var request = $.ajax({
  //     method: "post",
  //     url: "/question",
  //     data: question_form,
  //   })

  //   request.done(function(choice_data) {

  //     $(".questions > .choices").append(choice_data)
  //   })

  // })

// Adds first question to survey
  // $(document).on("submit", ".survey_form", function(event) {
  //   event.preventDefault();

  //   var survey_form = $(".survey_form").serialize();
  //   var choice_form = $('.choice_form').serialize();

  //   var request = $.ajax({
  //     method: "post",
  //     url: "/survey",
  //     data: survey_form,
  //   })
  //   request.done(function(question_form){
  //     $(".questions").append(question_form)
  //   })

  //   request.fail(function(question_form) {
  //     console.log("fail.");

  //   })

  // })



// });
