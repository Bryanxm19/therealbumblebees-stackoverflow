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
  @question = Question.find_by_id(params[:id])
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
  @question = Question.find_by_id(params[:id])
  erb :'/questions/show'
end


get '/questions/:id/edit' do
    @question = Question.find(params[:id])
    if logged_in? && (current_user.id == @question.user_id)
      erb :'/questions/edit'
    else
      @errors = ["404 Page does not exist for you."]
      erb :"/questions/show"
    end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if logged_in? && (current_user.id == @question.user_id)
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @errors = question.errors.full_messages
      erb :'/questions/edit'
    end
  else
    @errors = ["404 Page does not exist for you."]
    erb :"/questions/show"

  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])

  if logged_in? && (current_user.id == @question.user_id)
    @question.destroy
  end
  redirect "/questions"
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

post "/questions/:question_id/answers/:answer_id/vote" do
  answer = Answer.find(params[:answer_id])
  vote_type = params[:vote_type]
  answer.votes.create(user_id: session[:user_id], up_down: vote_type)
  answer.vote_count.to_s
end

get "/questions/:question_id/comments/new" do
  if logged_in?
    @question = Question.find(params[:question_id])
    erb :'/comments/new'
  else
    @errors = ["Please Login"]
    erb :'/login'
  end
end

post "/questions/:question_id/comments/new" do
  if logged_in?
  comment = Comment.new(params[:comment])
    if comment.save
      redirect "/questions/#{params[:comment][:commentable_id]}"
    else
      # if a current user, show errors
      # else redirect to login
      @question = Question.find(params[:comment][:commentable_id])
      @errors = comment.errors.full_messages
      erb :'/questions/show'
    end
  else
    @errors = ["Please Login"]
    erb :'/login'
  end
end
