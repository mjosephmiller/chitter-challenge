feature 'user sign out' do

  let!(:user) do
      User.create(email: 'user@user.com', password: 'user', password_confirmation: 'user', name: 'name', username: 'username')
    end

  scenario 'a user can sign out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content "Until next time!"
    expect(page).not_to have_content "Welcome, #{user.email}"
  end
end
