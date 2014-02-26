get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username],
                      password_digest: params[:password])
  session[:user_id] = user.id
  redirect '/'
end

post '/signup' do
  user = User.create(username: params[:username],
                     password_digest: params[:password])
  redirect '/login'
end
