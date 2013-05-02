helpers do

  def login_check
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
    else
      redirect to '/login'
    end
  end

end
