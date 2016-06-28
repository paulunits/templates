get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions/new' do
  
  @user = User.find_by(username: params[:username])
  password = params[:password]

 
  if @user && @user.authenticate(password)
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = "Your username or password was incorrect"
  
    erb :'/sessions/new'
  end
end

get '/sessions/delete' do
  session.delete(:user_id)
  redirect '/'
end