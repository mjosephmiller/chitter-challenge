class ChitterChallenge < Sinatra::Base


  post '/peep' do
    if user = current_user
      Peep.create(user: user, peep: params[:peep], time: Time.new)
      redirect '/'
    elsif
      redirect '/sessions/new'
    end
  end
end
