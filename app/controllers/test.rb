get '/test' do
  erb :"questions/_view_question", locals: {question: Question.first}
end
