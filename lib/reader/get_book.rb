class Reader::GetBook
  require 'net/http'
  require 'json'

  def self.from_google_books(query)
    url = "https://www.googleapis.com/books/v1/volumes?q=#{query}&maxResults=5&orderBy=relevance&printType=books&key=#{ENV['GOOGLE_BOOKS_KEY']}"
    uri = URI(url)
    response = Net::HTTP.get(uri)

  end




end
