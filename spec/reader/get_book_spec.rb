require 'spec_helper'
require 'pry'

RSpec.describe Reader::GetBook do

  describe '.from_google_books' do
    it 'can fetch and parse books data from the Google Books API' do
     VCR.use_cassette("reader") do
       response = Reader::GetBook.from_google_books('ruby')
       expect(response).to be_a(Array)  
       # When the method parses the json it's a hash, but then it sets it to a variable (books) and iterates over books['items'] which is an Array, so the return value of response is an array in this method.
      end
    end
  end
end

=begin 
These tests may need to be altered with data from spec/fixtures/vcr_cassettes/reader.yml
if spec/fixtures is deleted, or VCR generates a new cassette (for example, the first 
time you run the tests after downloading this program). If the body in reader.yml is 
not readable, you can find the return values of the methods in this test by running 
bin/console, then Reader::GetBook.from_google_books('ruby') or whatever search term you'd 
like to use for these tests, then Reader::Book.all.last
=end
