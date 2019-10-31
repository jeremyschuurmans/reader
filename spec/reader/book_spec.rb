require 'spec_helper'
require 'pry'

RSpec.describe Reader::Book do
  let(:book) { Reader::Book.new('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribners' ) }
  let(:another_book) { Reader::Book.new('The Sun Also Rises', 'Ernest Hemingway', 'Scribners' ) }
  let(:books) { Reader::Book.class_variable_get(:@@books) }

  describe '@@books' do
    it 'is an array' do
      expect(books).to be_a(Array)
    end
  end

  describe '#initialize' do
    it 'initializes with a title, author, and publishing company' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.publisher).to eq('Scribners')
    end

    it 'defaults subtitle to nil when no subtitle is given' do
      expect(book.subtitle).to eq(nil)
    end
  end

  describe '.all' do
    it 'returns array of Book objects' do
      expect(Reader::Book.all).to be_a_kind_of(Array)
        
      expect(Reader::Book.all).to include(book)
      expect(Reader::Book.all).to include(another_book)
    end
  end
end
