get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  # @question = Question.find_by(question_id: params[:question_id])
  puts @question
  erb :'/users/show'
end

post '/users' do
  user = User.create(params[:user])
  if user.valid?
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end
