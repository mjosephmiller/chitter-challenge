feature 'a user can sign up' do

  let!(:user) do
    User.create(email: 'user@domain.com', password: 'user')
  end

  scenario 'a user can sign up as a new user' do
    expect { sign_up }.to change(User, :count)
    visit '/'
    expect(page).to have_content("Welcome, #{user.email}!")
  end
end
