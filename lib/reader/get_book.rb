class Reader::GetBook
  require 'net/http'
  require 'json'

  def self.from_google_books(query)
    # retrieve data from Google Books API
    # parameters: max 5 results, ordered by relevance, books only
    url      = "https://www.googleapis.com/books/v1/volumes?q=#{query}&maxResults=5&orderBy=relevance&printType=books&key=#{ENV['GOOGLE_BOOKS_KEY']}"
    uri      = URI(url)
    response = Net::HTTP.get(uri)
    books    = JSON.parse(response)
    
    # iterate through parsed JSON creating new Book objects
    books['items'].each do |item|
      title       = item['volumeInfo']['title']
      subtitle    = item['volumeInfo']['subtitle']
      if item['volumeInfo']['authors'] # some books don't have authors in the API
        author = item ['volumeInfo']['authors'].join(', ')
      else
        author = 'Author not found'
      end
      if item['volumeInfo']['publisher'] # same with publishers
        publisher = item['volumeInfo']['publisher']
      else
        publisher = 'Publisher not found'
      end
      
      Reader::Book.new(title, subtitle, author, publisher)
    end
  end
end
