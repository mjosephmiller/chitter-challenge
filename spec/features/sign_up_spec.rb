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
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

end
