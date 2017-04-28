get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  if logged_in? && (current_user.id == @comment.user_id)
  @comment = comment.find(params[:id])
  erb :'/comments/edit'
  else
  redirect "/questions/#{@comment.question_id}"
  end

end

put '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.assign_attributes(params[:comment])
  if logged_in? && (current_user.id == @comment.user_id)
    if @comment.save
      redirect "/questions/#{@comment.question_id}"
    else
      @errors = @comment.errors.full_messages
      erb :'/comments/edit'
    end
  else
  redirect "/questions/#{@comment.question_id}"
  end
end



delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  if logged_in? && (current_user.id == @comment.user_id)
    @comment.destroy
  end
  redirect "/questions/#{@comment.question_id}"
end
