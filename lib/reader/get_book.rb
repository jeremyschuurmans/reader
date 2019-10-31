class Reader::GetBook
  require 'net/http'
  require 'json'

  def self.from_google_books(query)
    url      = "https://www.googleapis.com/books/v1/volumes?q=#{query}&maxResults=5&orderBy=relevance&printType=books&key=#{ENV['GOOGLE_BOOKS_KEY']}"
    uri      = URI(url)
    response = Net::HTTP.get(uri)
    books    = JSON.parse(response)

    books['items'].each do |item|
      title       = item['volumeInfo']['title']
      subtitle    = item['volumeInfo']['subtitle']
      author      = item ['volumeInfo']['authors'].join(', ')
      if item['volumeInfo']['publisher']
        publisher = item['volumeInfo']['publisher']
      else
        publisher = 'Publisher not found'
      end
      
      Reader::Book.new(title, subtitle, author, publisher)
    end
  end
end
