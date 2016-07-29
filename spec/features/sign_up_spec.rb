feature 'user sign up' do

  let!(:user) do
    User.create(email: 'user@domain.com', password: 'user', name: 'name', username: 'username')
  end

  scenario 'a user can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    visit '/'
    expect(page).to have_content("Welcome, #{user.email}!")
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'user1') }.not_to change(User, :count)
  end
end
