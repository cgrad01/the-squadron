get '/choices/:id' do
  choice = Choice.where(id: params[:id]).first
  return params[:id] if !choice.is_a?(Choice)
  choice.delete
  redirect '/survey/1'
end
