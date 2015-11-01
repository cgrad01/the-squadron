get '/questions/new' do
  erb :'questions/_new_question', layout: false
end

post '/questions/new' do
  question = Question.new(text: params[:question], survey_id: current_survey.id)
  if question.save
    status 200
    erb :"questions/_question_show", layout: false, locals: {question: question}
  else
    status 400
    params[:question]
  end



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



