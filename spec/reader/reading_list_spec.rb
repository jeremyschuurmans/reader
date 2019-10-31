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
      expect(list[1].title).to eq('The Great Gatsby')
      expect(list[0].subtitle).to eq('Learn Web Development with Rails')
      expect(list[1].subtitle).to eq(nil)
      expect(list[0].author).to eq('Michael Hartl')
      expect(list[1].author).to eq('F. Scott Fitzgerald')
      expect(list[0].publisher).to eq('Addison-Wesley')
      expect(list[1].publisher).to eq('Scribners')
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
