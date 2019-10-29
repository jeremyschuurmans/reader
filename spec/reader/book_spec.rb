require 'spec_helper'

RSpec.describe Reader::Book do

  describe 'Book' do
    let(:book) { Reader::Book.new( title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', publisher: 'Scribners') }

    describe '@@all' do
      it 'is a hash' do
        all = Reader::Book.class_variable_get(:@@all)

        expect(all).to be_a(Hash)
      end
    end

    describe '#initialize' do
      it 'initializes with a title, author, and publishing company' do
        expect(book.title).to eq('The Great Gatsby')
        expect(book.author).to eq('F. Scott Fitzgerald')
        expect(book.publisher).to eq('Scribners')
      end
    end
  end
end
