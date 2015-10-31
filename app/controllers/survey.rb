get '/survey/:survey_id/results' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions


  erb :'/survey/results', locals: {survey: survey, survey_questions: survey_questions}
end

get '/survey/:survey_id' do
  survey = Survey.find(params[:survey_id])
  survey_questions = survey.questions

  erb :'/survey/view', locals: {survey: survey, survey_questions: survey_questions}

end


