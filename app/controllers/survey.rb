
get '/survey/:survey_id/results' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions


  erb :'/survey/results', locals: {survey: survey, survey_questions: survey_questions}
end

get '/survey/new' do
  erb :'/survey/new_survey'
end

post '/survey' do
  user = User.find(session[:user_id])
  survey = Survey.new(creator_id: user.id, title: params[:survey][:title])

    if survey.save
      erb :'/questions/_new_question', locals: {survey: survey}, layout: false
    else
      @errors = survey.errors.full_messages
      erb :'/survey/new_survey'
    end
  end


get '/survey/:survey_id' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions

  erb :'/survey/view', locals: {survey: survey, survey_questions: survey_questions}
end

get '/question' do
  question = Question.new(params[:question])
  erb :'/questions/_new_question', locals: {question: question}
end



post '/question' do
  question = Question.new(params[:question])

  if question.save
    erb :"/questions/_new_choice"
  else
    @errors = question.errors.full_messages
  end
end

post '/choice' do
  choice = Choice.new(params[:choice])
  if choice.save
    erb :'questions/_new_choice', locals: {choice: choice}
  else
    @errors = choice.errors.full_messages
    erb :'questions/_new_choice'
  end
end


