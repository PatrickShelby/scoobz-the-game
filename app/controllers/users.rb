
get '/' do
  erb :home
end

# -------------------------------------------------- login ---------------------------------------------------------------------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  if User.first != nil && params[:username] == User.find_by(username: params[:username]).username && params[:password] == User.find_by(username: params[:username]).password
    session[:user_id] = User.find_by(username: params[:username]).id
    redirect '/'
  else
    erb :invalid_login
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end
# -------------------------------------------------- new users ---------------------------------------------------------------------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @new_user = User.new(username: params[:username], password: params[:password])
  if @new_user.save
    session[:user_id] = @new_user.id
    redirect '/'
  else
    p ":)"* 100
    erb :error_messages
  end
end
