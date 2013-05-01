helpers do

  def login_check
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      puts 'session create'
      session[:logged_in] = true
      session[:user] = @user
    else
      redirect to '/login'
    end
  end

end
