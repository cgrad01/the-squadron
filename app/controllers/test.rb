get '/test' do
  @question=Question.first
  erb :"questions/_new_choice"
end
