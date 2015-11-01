post '/choices/new' do
  question_id = params[:question_id].to_i
  erb :"questions/_new_choice", layout: false, locals: {question_id: question_id}
end

post '/choices/new_choice' do
  choice = Choice.new(question_id: params[:question_id].to_i, text: params[:choice_content])
  params.inspect.to_s
  if choice.save
    params[:choice_content]
  else
    status 400
    params.inspect.to_s
  end
end



post '/choices/:id' do
  choice = Choice.where(id: params[:id]).first
  choice.delete
  return "success"
end

get '/choices' do
  choice = Choice.new(params[:choice])
  erb :'questions/_new_choice', locals: {choice: choice}, layout: false
end

post '/choices' do
  @question = Question.find(params[:choice][:question_id])
  choice = Choice.new(params[:choice])
  if choice.save
    erb :'questions/_new_choice', locals: {choice: choice}, layout: false
  else
    @errors = choice.errors.full_messages
    erb :'questions/_new_choice'
  end
end
