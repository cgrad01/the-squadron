
get '/choices/:id' do
  choice = Choice.where(id: params[:id]).first
  return "choice with id #{params[:id]} is not a choice object" unless choice.is_a?(Choice)
  choice.delete
  redirect '/survey/1'
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

post '/choices/new' do
  @question = Question.new(params[:question])
    erb :'questions/_new_question', layout: false
end


