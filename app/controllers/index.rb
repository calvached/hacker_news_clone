get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    session[:username] = user.username
    redirect '/'
  end
end

post '/signup' do
  user = User.create(username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  redirect '/login'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


get '/profile/:id' do
  @id = session[:user_id]
  if @id
    @username = session[:username]
    erb :profile
  else
    redirect '/login'
  end
end

post '/upvote' do
  p params[:data]
end
