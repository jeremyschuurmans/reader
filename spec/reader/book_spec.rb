require 'spec_helper'

RSpec.describe Reader::Book do

  describe 'Book' do
    let(:book) { Reader::Book.new( title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', publisher: 'Scribners') }

    describe 'books' do
      it 'is a hash' do
        books = Reader::Book.class_variable_get(:@@books)

        expect(books).to be_a(Hash)
      end
    end

    describe '#initialize' do
      it 'initializes with a title, author, and publishing company' do
        expect(book.title).to eq('The Great Gatsby')
        expect(book.author).to eq('F. Scott Fitzgerald')
        expect(book.publisher).to eq('Scribners')
      end
    end

    describe '.all' do
      it 'returns books hash' do
        expect(Reader::Book.all).to be_a_kind_of(Hash)

        expect(Reader::Book.all).to include('title' => 'The Great Gatsby')
      end
    end
  end
end
