get '/questions/new' do
  erb :'questions/_new_question', layout: false
end

post '/questions/new' do
  # question = Question.new(text: params[:question], survey_id: get_current_survey.id)
  # question.survey_id
  get_current_survey.id
end

post '/questions/:id' do
  question = Question.where(id: params[:id]).first
  return "question with id #{params[:id]} is not a question object" unless question.is_a?(Question)
  question.choices.each{|choice| choice.delete}
  question.delete
  "questions deleted"
end

get '/questions' do
  @question = Question.new(params[:question])
  erb :'/questions/_new_question', layout: false
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    erb :"/questions/_new_choice", layout: false
  else
    @errors = question.errors.full_messages
  end
end



