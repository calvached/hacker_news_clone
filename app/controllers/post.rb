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

get '/profile/:id/posts' do
  @user = User.find(params[:id])

  erb :user_posts
end

get '/profile/:id/comments' do
  @user = User.find(params[:id])

  erb :user_comments
end
