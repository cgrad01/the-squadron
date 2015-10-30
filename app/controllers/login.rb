get '/signup' do
  erb :login
end
# one page does the login and signup
get '/login' do
  erb :login
end

post '/users' do
  if params[:user][:password] == params[:confirm_password]
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/profile/#{user.id}"
    else
      @errors = user.errors.full_messages
      erb :login, locals: {user: user}
    end
  else
    @errors = ["Passwords do not match"]
    erb :login, locals: {user: user}
  end
end

post '/login' do
  user = User.find_by(name: params[:user][:name])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Incorrect username or password"]
    erb :login, locals: {user: user}
  end
end

get '/user/:id' do
  "Profile page goes here"
end

get '/logout' do
  session.clear
  redirect '/'
end
