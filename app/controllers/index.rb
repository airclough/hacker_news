get '/' do
  @posts = Post.order('created_at DESC').where('post_id is null')
  erb :index
end
