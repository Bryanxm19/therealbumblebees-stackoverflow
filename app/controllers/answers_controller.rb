get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  if logged_in? && (current_user.id == @answer.user_id)
    @answer = Answer.find(params[:id])
    erb :'/answers/edit'
  else
    redirect "/questions/#{@answer.question_id}"
  end
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.assign_attributes(params[:answer])
  if logged_in? && (current_user.id == @answer.user_id)
    if @answer.save
      redirect "/questions/#{@answer.question_id}"
    else
      @errors = @answer.errors.full_messages
      erb :'/answers/edit'
    end
  else
  redirect "/questions/#{@answer.question_id}"
  end
end



delete '/answers/:id' do
  @answer = Answer.find(params[:id])
  if logged_in? && (current_user.id == @answer.user_id)
    answer_id = @answer.id
    @answer.destroy
    content_type :json
    { answer_id: answer_id }.to_json
  else
    redirect "/questions/#{@answer.question_id}"
  end
end

post "/questions/:question_id/answers/new" do
  if logged_in?
    answer = Answer.new(params[:answer])
    if answer.save
      if request.xhr?
        @question = answer.question
        status 200
        erb :_answers, layout: false
      else
        redirect "/questions/#{params[:answer][:question_id]}"
      end
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

post "/questions/:question_id/answers/:answer_id/vote_twice" do
answer = Answer.find(params[:answer_id])
  puts "VOTE COUNT HEREEEEEEEE"
  puts answer.vote_count.to_s

  vote = Vote.find_by(user_id: current_user.id, votable_id: params[:answer_id], votable_type: "Answer")
  vote.destroy
  puts "VOTE COUNT HEREEEEEEEE"
  puts answer.vote_count.to_s

  answer = Answer.find(params[:answer_id])
  vote_type = params[:vote_type]
  hey = answer.votes.create(user_id: session[:user_id], up_down: vote_type)
  puts "VOTE COUNT HEREEEEEEEE"
  puts answer.vote_count.to_s
  puts hey.persisted?
  puts hey.up_down
    puts hey.errors.full_messages

  answer.vote_count.to_s
end

post "/questions/:question_id/answers/:answer_id/unvote" do
  vote = Vote.find_by(user_id: current_user.id, votable_id: params[:answer_id], votable_type: "Answer")
  vote.destroy
  answer = Answer.find(params[:answer_id])
  answer.vote_count.to_s
end
