feature 'view one bookmark' do

  scenario 'on loading single bookmark route, display the bookmarks' do
    Bookmarks.add('http://www.makersacademy.com')
    Bookmarks.add('http://www.destroyallsoftware.com')
    Bookmarks.add('http://www.google.com')

    visit('/bookmarks/3')
  
    expect(page).not_to have_content "http://www.makersacademy.com"
    expect(page).not_to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
