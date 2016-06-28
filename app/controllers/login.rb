get '/session-viewer' do
   session.inspect
end

get '/login' do
  @posts = Post.order(created_at: :desc)

  erb :'login/login'
end

post '/login' do
  @user = User.find_by(user_name: params[:user_name])
    if @user.authenticate(params[:password_hash])
      session[:user_id] = @user.id
      session[:name] = @user.user_name
      redirect "/users/#{@user.id}"
    else
      erb :'login/login'
    end
end

get '/logout' do
  session.delete(:user_id)

  redirect '/login'
end