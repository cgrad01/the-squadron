get '/survey/:survey_id' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions

  erb :'/survey/view', locals: {survey: survey, survey_questions: survey_questions}

end

=begin
    <div> <%= question.text %> </div>
    <% question_choices(question).each do |choice| %>
      <div> <%= choice.text %> </div>
    <% end %>
=end
