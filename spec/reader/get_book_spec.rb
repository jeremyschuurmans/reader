require 'spec_helper'
require 'pry'

RSpec.describe Reader::GetBook do
  describe '.from_google_books' do
    it 'can fetch and parse books data from the Google Books API' do
     VCR.use_cassette("reader") do
       response = Reader::GetBook.from_google_books('ruby')
       expect(response).to be_a(Array)  
       # When the method parses the json it's a hash, but then it sets it to a variable (books) and iterates over books['items'] which is an Array. 
      end
    end

    it 'creates objects out of the JSON data' do
      books = Reader::Book.all

      expect(books.last.title).to eq('Ruby on Rails Tutorial')
      expect(books.last.subtitle).to eq('Learn Web Development with Rails')
      expect(books.last.author).to eq('Michael Hartl')
      expect(books.last.publisher).to eq('Addison-Wesley')
    end
  end
end
