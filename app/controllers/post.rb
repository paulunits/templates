get '/session-viewer' do
   session.inspect
end

get '/posts' do
  redirect '/users/new' unless session[:user_id]

  session[:user_views] = 0 unless session[:user_views]
  session[:user_views] +=1

  redirect '/posts/new'
end

get '/posts/new' do
  erb :'posts/new'
end

post '/posts' do
  @post = Post.new(params[:post])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    @errors = @posts.errors.full_messages
    erb :'posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end

get '/posts/:id/edit' do
  redirect '/users/new' unless session[:user_id]

  session[:user_views] = 0 unless session[:user_views]
  session[:user_views] +=1
  @post = Post.find(params[:id])
  erb :'posts/edit'
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect "/posts/#{@post.id}"
end

delete '/posts/:id' do

  redirect '/login' unless session[:user_id]

  session[:user_views] = 0 unless session[:user_views]
  session[:user_views] +=1
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/login'
end