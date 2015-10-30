get '/signup' do
  erb :login
end
# one page does the login and signup
get '/login' do
  erb :login
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    errors = user.errors.full_messages
    erb :'users/new', locals: {user: user, errors: errors}
  end
end



post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    errors = user.errors.full_messages
    erb :'users/login'
  end
end

get '/user/:id' do
  "Profile page goes here"
end
