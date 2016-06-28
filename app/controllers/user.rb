get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    
    redirect '/users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# get '/session-viewer' do
#    session.inspect
# end

# get '/users' do
#   redirect '/login' unless session[:user_id]

#   session[:user_views] = 0 unless session[:user_views]
#   session[:user_views] +=1

#   redirect '/login'
# end

# get '/users/new' do
#   erb :'users/new'
# end

# post '/users' do
# p params

#   @user = User.new(params[:user])
#   if @user.save

#     redirect "/login"

#   else
#     @errors = "Registration failed"
#     erb :"/users/new"
#   end
# end

# get '/users/:id' do
#   @user = User.find(params[:id])
#   @posts = Post.where(user_id: params[:id])
#   erb :'users/show'
# end