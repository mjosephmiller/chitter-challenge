def sign_up(email: 'user@domain.com',
              password: 'user',
              password_confirmation: 'user')

  visit '/users/new'
  fill_in :email, :with => email
  fill_in :password, :with => password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end