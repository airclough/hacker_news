get '/login' do
  erb :login
end

post '/login' do
  #helper
  login_check
  redirect '/'
end

get '/logout' do
  session.clear
  redirect to '/'
end

get '/secret_page' do
  
  if session[:logged_in] == true then
    erb :secret_page
  else
    redirect to '/'
  end

end
