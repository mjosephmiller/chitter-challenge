feature 'buzz' do

  scenario 'homepage should show list of all user buzzes' do
    sign_in(email: 'user@domain.com', password: 'user')
    visit '/buzz/new'
    fill_in 'buzz', with: 'This is a test buzz lol'
    click_button 'Post buzz'
    expect(page).to have_content 'This is a test buzz lol'
  end
end
