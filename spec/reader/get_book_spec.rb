require 'spec_helper'
require 'pry'

RSpec.describe Reader::GetBook do
  describe '.from_google_books' do
    it 'can fetch and parse books data from the Google Books API' do
      VCR.use_cassette("reader") do
        response = Net::HTTP.get_response(URI("https://www.googleapis.com/books/v1/volumes?q=ruby&maxResults=5&orderBy=relevance&printType=books&key=#{ENV['GOOGLE_BOOKS_KEY']}"))
        expect(response.body).to be_a(String) 
        expect(response.body).to include('title')
        expect(response.body).to include('authors')
        expect(response.body).to include('publisher')
        expect(response.body).not_to include('error: {')
      end



    end
  end

end
