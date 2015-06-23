get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  session[:user_id] = User.find(name: params[:name]).id
  redirect '/'
end

delete '/sessions/:id' do
  session[:user_id] = nil
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @new_user = User.create(
    name: params[:name],
    email: params[:email],
    password_hash: params[:password]
  )

  session[:user_id] = User.find(name: params[:name]).id
  redirect '/'
end
