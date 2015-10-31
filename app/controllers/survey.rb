

get '/surveys/:survey_id/results' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions


  erb :'/survey/results', locals: {survey: survey, survey_questions: survey_questions}
end

get '/surveys/new' do
  erb :'/survey/new_survey'
end


post '/surveys' do
  user = User.find(session[:user_id])
  survey = Survey.new(creator_id: user.id, title: params[:survey][:title])

  if survey.save
    erb :'/questions/_new_question', locals: {survey: survey}, layout: false
  else
    @errors = survey.errors.full_messages
    erb :'/survey/new_survey', layout: false
  end
end


get '/surveys/:survey_id' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions

  erb :'/survey/view', locals: {survey: survey, survey_questions: survey_questions}

end




post '/questions' do
  question = Question.new(params[:question])

  if question.save
    erb :"/questions/_new_choice"
  else
    @errors = question.errors.full_messages
  end
end




