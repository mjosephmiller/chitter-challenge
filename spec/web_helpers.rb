def sign_up(email: 'user@domain.com',
            password: 'user',
            password_confirmation: 'user', name: 'name', username: 'username')

  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name, with: name
  fill_in :username, with: username
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit 'sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def post_peep
  sign_in(email: 'user@domain.com', password: 'user')
  fill_in 'peep', with: 'This is a test peep lol'
  click_button 'Post peep'
end
