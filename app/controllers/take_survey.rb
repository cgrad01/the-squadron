get '/take/:survey_id' do
  if logged_in? == false
    redirect '/login'
  end
  survey = Survey.find(params[:survey_id])
  user = User.find(session[:user_id])
  if user_has_taken?(survey) || logged_in? == false
    redirect "/"
  else
    erb :'/take/survey', locals: {survey: survey, user: user}
  end
end

post '/take/:survey_id' do
  answers = params

  answers.each do |key, value|
    if key == "survey_id" || key == "splat" || key == "captures"
      next
    end
    response = Response.new(taker_id: session[:user_id], choice_id: value.to_i, survey_id: params[:survey_id] )
    response.save
  end

  redirect "/"

end

