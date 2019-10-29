require 'spec_helper'

RSpec.describe Reader::Book do
  @title = nil
  @author = nil
  @publisher = nil

  describe 'Book' do
    let(:book) { Reader::Book.new(@title = 'The Great Gatsby', @author = 'F. Scott Fitzgerald', @publisher = 'Scribners') }
    describe '#initialize' do
      it 'initializes with a title, author, and publishing company' do
        expect(book.title).to eq('The Great Gatsby')
      end
    end
  end



end