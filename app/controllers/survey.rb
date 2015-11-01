post '/hideresults' do
 # ajax request that hides results on user profile page

end

post '/surveys/:survey_id/results' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions

  erb :'/survey/_results', layout: false, locals: {survey: survey, survey_questions: survey_questions}
end


get '/surveys/new' do
  erb :'/survey/new_survey', layout: false
end

post '/surveys' do
  user = User.find(session[:user_id])
  survey = Survey.new(creator_id: user.id, title: params[:survey][:title])
  if survey.save
    session[:survey_id] = survey.id
    erb :'/questions/_new_question', locals: {survey: survey}, layout: false
  else
    @errors = survey.errors.full_messages
    erb :'/survey/new_survey', layout: false
  end
  status 400
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

post '/surveys/new' do
  params.to_s
  survey=Survey.new(title: params[:title], creator_id: current_user.id)
  if survey.save
    set_current_survey(survey)
    status 200
    erb :"questions/_new_question", layout: false
  else
    status 400
    params[:title]
  end
end


