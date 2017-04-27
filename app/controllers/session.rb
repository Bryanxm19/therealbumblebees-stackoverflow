get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Email or Password is Incorrect"]
    erb :login
  end
end


get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
