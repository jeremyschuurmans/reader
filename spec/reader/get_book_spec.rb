require 'spec_helper'
require 'pry'

RSpec.describe Reader::GetBook do
  describe '.from_google_books' do
    it 'can fetch and parse books data from the Google Books API' do
     VCR.use_cassette("reader") do
       response = Reader::GetBook.from_google_books('ruby')
       expect(response).to be_a(Hash) 
      end
    end

    it 'creates objects out of the JSON data' do
      books = Reader::Book.all

      expect(books.first.title).to eq('Ruby')
    end



  end
end
