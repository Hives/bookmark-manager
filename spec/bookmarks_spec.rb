require 'bookmarks'

describe Bookmarks do

  describe '#all' do
    it 'returns all the bookmarks' do
      # Add the test data
      Bookmarks.add('http://www.makersacademy.com')
      Bookmarks.add('http://www.destroyallsoftware.com')
      Bookmarks.add('http://www.google.com')
  
      bookmark = Bookmarks.get_by_id(2)
      expect(bookmark["url"]).to eq 'http://www.destroyallsoftware.com'
    end
  end

  describe '#display_all' do
    it 'returns a list of bookmarks' do
      # Add the test data
      Bookmarks.add('http://www.makersacademy.com')
      Bookmarks.add('http://www.destroyallsoftware.com')
      Bookmarks.add('http://www.google.com')
  
      bookmarks = Bookmarks.display_all
  
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#add bookmark' do
    it 'adds a bookmark to the database' do

      Bookmarks.add('http://makers.tech')
      bookmarks = Bookmarks.display_all
      expect(bookmarks).to include('http://makers.tech')
    end
  end

end
