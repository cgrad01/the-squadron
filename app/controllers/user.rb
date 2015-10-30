get '/profile/:id' do
  user = User.find(params[:id])
  surveys = user.surveys.sort {|a, b| b.created_at <=> a.created_at}
  erb :profile, locals: {user: user, surveys: surveys}
end

