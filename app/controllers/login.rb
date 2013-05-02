get '/register' do
  erb :register
end

post '/register' do
  @user = User.create(params)
  session[:user_id] = @user.id
  partial :_header
end

post '/login' do
  #helper
  login_check
  partial :_header
end

get '/logout' do
  session.clear
  redirect to '/'
end
