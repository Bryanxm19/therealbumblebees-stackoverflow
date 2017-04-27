get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'/answers/edit'
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.assign_attributes(params[:answer])

  if @answer.save
    redirect "/questions/#{@answer.question_id}"
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/edit'
  end
end

delete '/answers/:id' do
  @answer = Answer.find(params[:id])

  if logged_in? && (current_user.id == @answer.user_id)
    @answer.destroy
  end
  redirect "/questions/#{@answer.question_id}"
end
