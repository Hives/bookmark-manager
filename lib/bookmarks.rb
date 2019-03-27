require 'dotenv'
Dotenv.load
require 'pg'

class Bookmarks

  def self.display_all
    connect_db
    @connection.exec("SELECT * FROM bookmarks") do |result|
      result.map do |row|
        row["url"]
      end
    end
  end

  def self.add(url)
    connect_db
    @connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
  end

  def self.get_by_id(id)
    connect_db
    @connection.exec("SELECT * FROM bookmarks WHERE id = #{id}")[0]
  end

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end


end
