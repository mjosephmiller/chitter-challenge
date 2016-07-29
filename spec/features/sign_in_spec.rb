feature 'user sign in' do

  let!(:user) do
      User.create(email: 'user@user.com', password: 'user', password_confirmation: 'user', name: 'name', username: 'username')
    end

  scenario 'a user can sign in with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end
