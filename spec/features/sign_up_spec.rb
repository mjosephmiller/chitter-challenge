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
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "I can't sign up with an already registered email address" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email is already taken'
  end
end
