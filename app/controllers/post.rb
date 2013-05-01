get '/post/submit' do
  # @user = find()

  erb :post_submit
end

post '/post/submit' do
  @post = Post.create(params)
  erb :index
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end


