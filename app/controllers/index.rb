get '/' do
  # Look in app/views/index.erb
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


get '/profile/:id' do
  @id = session[:user_id]
  @username = session[:username]
  erb :profile
end


get '/create_post' do
  erb :create_post
end

post '/create_post' do
  post = Post.create(user_id: session[:user_id],
              title: params[:title],
              url: params[:url])

  redirect "/posts/#{post.id}"
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post
end

post '/posts/:id' do
  Comment.create(post_id: params[:id],
                user_id: session[:user_id],
                content: params[:content])

  redirect "/posts/#{params[:id]}"
end


