helpers do
  def current_user
    return unless username = request.cookies['current_user']
    User.find(login: username)
  end
end

get '/login' do
  slim :login
end

post '/login' do
  username = params['username']
  password = params['password']

  user = User.find(login: username)

  if  user && password == user.password
    response.set_cookie('current_user', user.login)
    redirect '/'
  else
    "Username or Password incorrect"
  end
end

get '/logout' do
  response.set_cookie('current_user', nil)
  redirect '/'
end
