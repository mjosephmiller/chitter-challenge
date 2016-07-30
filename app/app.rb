ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/data_mapper_setup'

class ChitterChallenge < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'


  get '/' do
  @peeps = Peep.all
  erb :'home'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  post '/peep' do
    if user = current_user
      Peep.create(user: user, peep: params[:peep], time: Time.new)
      redirect '/'
    elsif
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Until next time!"
    redirect to '/'
  end



  run! if app_file == $0
end
