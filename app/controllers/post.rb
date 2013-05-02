get '/post/submit' do
  erb :post_submit
end

post '/post/submit' do
  @post = Post.create(title:params[:title], body:params[:body], user_id:session[:user_id])
  return "#{@post.id}"
end

post '/comment/submit' do
  p params
  @comment = Post.create(post_id: params["post_id"], body: params["body"], user_id: session[:user_id])
  p @comment.id
  return "/post/#{@comment.id}"
end


get '/post/:id' do
  @post = Post.find(find_parent(params[:id]))
  @comments = @post.comments
  erb :post
end


