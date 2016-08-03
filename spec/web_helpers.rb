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

def post_buzz
  sign_in(email: 'user@domain.com', password: 'user')
  visit '/buzz/new'
  fill_in 'buzz', with: 'This is a test buzz lol'
  click_button 'Post buzz'
end
