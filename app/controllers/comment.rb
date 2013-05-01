post '/comment/submit' do
  @comment = Comment.create(params)
  redirect to "/post/#{@comment.post_id}"
end
