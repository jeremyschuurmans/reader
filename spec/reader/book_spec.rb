require 'spec_helper'
require 'pry'

RSpec.describe Reader::Book do
  let(:book)         { Reader::Book.new('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribners' ) }
  let(:another_book) { Reader::Book.new('The Sun Also Rises', 'Ernest Hemingway', 'Scribners' ) }

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
end
