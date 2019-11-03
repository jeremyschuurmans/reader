require 'spec_helper'

RSpec.describe Reader::ReadingList do
  let(:list)   { Reader::ReadingList.class_variable_get(:@@list) }
  let(:book)   { Reader::Book.all.last }
  let(:book_2) { Reader::Book.all.first }

  describe '@@list' do
    it 'is an array' do
      expect(list).to be_a(Array)
    end
  end

  describe '.add_to_list' do
    it 'adds books to the reading list' do
      Reader::ReadingList.add_to_list(book)
      Reader::ReadingList.add_to_list(book_2)

      expect(list[0].title).to eq('Ruby on Rails Tutorial')
      expect(list[1].title).to eq('Ruby')
      expect(list[0].subtitle).to eq('Learn Web Development with Rails')
      expect(list[1].subtitle).to eq(nil)
      expect(list[0].author).to eq('Michael Hartl')
      expect(list[1].author).to eq('Cynthia Bond')
      expect(list[0].publisher).to eq('Addison-Wesley')
      expect(list[1].publisher).to eq('Hogarth Press')
    end
  end

  describe '.view_list' do
    it 'returns the reading list array' do
      reading_list = Reader::ReadingList.view_list

      expect(reading_list).to be_a(Array)
      expect(reading_list.size).to eq(2)
    end
  end
end

=begin 
These tests may need to be altered with data from spec/fixtures/vcr_cassettes/reader.yml if spec/fixtures is deleted, or VCR generates a new cassette (for example, the first time you run the tests after downloading this program). If the body in reader.yml is not readable, you can find the return values of the methods in this test by running bin/console, then Reader::GetBook.from_google_books('ruby') or whatever search term you'd like to use for these tests, then Reader::Book.all.last, and Reader::Book.all.first
=end
