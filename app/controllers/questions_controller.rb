get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  if logged_in?
    erb :'/questions/new'
  else
    @errors = ["Please Login"]
    erb :'/login'
  end
  # <input type="hidden" name="question[user_id]" value="<%= current_user.id %>">
end

post '/questions' do
  if logged_in?
    question = Question.new(params[:question])
    if question.save
      redirect '/questions'
    else
      @errors = question.errors.full_messages
      erb :'/questions/new'
    end
  else
    @errors = ["Please Login"]
    erb :'/login'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post "/questions/:question_id/answers/new" do
  if logged_in?
  answer = Answer.new(params[:answer])
    if answer.save
      redirect "/questions/#{params[:answer][:question_id]}"
    else
      # if a current user, show errors
      # else redirect to login
      @question = Question.find(params[:answer][:question_id])
      @errors = answer.errors.full_messages
      erb :'/questions/show'
    end
  else
    @errors = ["Please Login"]
    erb :'/login'
  end
end

get '/questions/:id/edit' do
    @question = Question.find(params[:id])
    if current_user.id == @question.user_id
      erb :'/questions/edit'
    else
      @errors = ["Question does not belong to you."]
      erb :"/questions/show"
    end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if current_user.id == @question.user_id
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @errors = question.errors.full_messages
      erb :'/questions/edit'
    end
  else
    @errors = ["Question does not belong to you."]
    erb :"/questions/show"

  end
end
