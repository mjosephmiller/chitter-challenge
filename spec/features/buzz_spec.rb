feature 'a user Buzz will be displayed' do

  let!(:user) do
      User.create(email: 'user@user.com', password: 'user', password_confirmation: 'user', name: 'name', username: 'username')
    end
    
  scenario 'homepage should show list of all user buzzes' do
    sign_in(email: user.email, password: user.password)
    visit '/buzz/new'
    fill_in 'buzz', with: 'This is a test buzz lol'
    click_button 'Post'
    expect(page).to have_content 'This is a test buzz lol'
  end
end
