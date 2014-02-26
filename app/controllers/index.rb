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
    redirect '/'
  end
end

post '/signup' do
  user = User.create(username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  redirect '/login'
end
