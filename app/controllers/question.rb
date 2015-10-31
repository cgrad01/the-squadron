get '/questions/new' do
  erb :'questions/_new_question', layout: false
end

get '/questions/:id' do
  question = Question.where(id: params[:id]).first
  return "question with id #{params[:id]} is not a question object" unless question.is_a?(Question)
  question.delete
  redirect '/survey/1'
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



