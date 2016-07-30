feature 'peeps' do

  scenario 'homepage should show list of all user peeps' do
    p page
    post_peep
    expect(page).to have_content 'This is my first peep'
  end
end
