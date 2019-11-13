require 'spec_helper'
require 'pry'

RSpec.describe Reader::Book do
  describe '#initialize' do
    it 'initializes with a title, author, and publishing company, defaulting subtitle to nil when no subtitle is given' do
      book = Reader::Book.new('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribners')

      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.publisher).to eq('Scribners')
      expect(book.subtitle).to eq(nil)

      Reader::ListCreator.all_books.clear
    end
  end
end
