get '/questions/:id' do
  question = Question.where(id: params[:id]).first
  return "question with id #{params[:id]} is not a question object" unless question.is_a?(Question)
  question.delete
  redirect '/survey/1'
end
