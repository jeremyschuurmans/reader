require 'spec_helper'
require 'pry'

RSpec.describe Reader::GetBook do
  describe '.from_google_books' do
    it 'can fetch and parse books data from the Google Books API' do
     VCR.use_cassette("reader") do
      
       response = Reader::GetBook.from_google_books('ruby')
     
       expect(response).to be_an(Array)  
       # When the method parses the json it's a hash, but then it sets it to a variable (books) and iterates over books['items'] which is an Array, so the return value of response is an array in this method.
      end
    end
  end
end
