get '/user/:id' do
  @user = User.find(params[:id])
  @posts = Post.where("user_id = ? and post_id is null", @user.id)
  @comments = Post.where("user_id = ? and post_id is not null", @user.id)

  erb :user
end