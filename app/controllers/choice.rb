get '/choices/:id' do
  choice = Choice.where(id: params[:id]).first
  return "choice with id #{params[:id]} is not a choice object" unless choice.is_a?(Choice)
  choice.delete
  redirect '/survey/1'
end
