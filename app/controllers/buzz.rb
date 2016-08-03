class Beehive < Sinatra::Base

  get '/buzz/new' do
    erb :'buzz/new'
  end

  post '/buzz' do
    if user = current_user
      Buzz.create(user: user, buzz: params[:buzz], time: Time.new)
      redirect '/'
    else
      flash.now[:errors] = ['You need to sign in to do that']
      erb :'sessions/new'
    end
  end
end
