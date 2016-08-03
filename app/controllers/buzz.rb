class ChitterChallenge < Sinatra::Base

  get '/buzz/new' do
    erb :'buzz/new'
  end

  post '/buzz' do
    if user = current_user
      Buzz.create(user: user, buzz: params[:buzz], time: Time.new)
      redirect '/'
    elsif
      redirect '/sessions/new'
    end
  end
end
