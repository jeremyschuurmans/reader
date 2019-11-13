require 'spec_helper'

RSpec.describe Reader::ListCreator do
  describe '.create_list' do
    it 'creates a list of book objects when new books are instantiated' do
      book_1     = Reader::Book.new("The Brothers Karamazov", "Fyodor Dostoevsky", "Random House")
      book_2     = Reader::Book.new("A Moveable Feast", "Ernest Hemingway", "Scribners")
      books_list = Reader::ListCreator.instance_variable_get(:@books)

      expect(books_list).to include(book_1)
      expect(books_list).to include(book_2)

      Reader::ListCreator.all_books.clear
      Reader::ListCreator.view_list.clear
    end
  end

  describe '.add_to_list' do
    it 'adds books to the reading list' do
      book_1       = Reader::Book.new("Ruby on Rails Tutorial", "Learn Web Development with Rails", "Michael Hartl", "Addison-Wesley")
      book_2       = Reader::Book.new("Ruby", "Cynthia Bond", "Hogarth Press")
      reading_list = Reader::ListCreator.instance_variable_get(:@reading_list)

      Reader::ListCreator.add_to_reading_list(book_1)
      Reader::ListCreator.add_to_reading_list(book_2)

      expect(reading_list[0].title).to eq('Ruby on Rails Tutorial')
      expect(reading_list[1].title).to eq('Ruby')
      expect(reading_list[0].subtitle).to eq('Learn Web Development with Rails')
      expect(reading_list[1].subtitle).to eq(nil)
      expect(reading_list[0].author).to eq('Michael Hartl')
      expect(reading_list[1].author).to eq('Cynthia Bond')
      expect(reading_list[0].publisher).to eq('Addison-Wesley')
      expect(reading_list[1].publisher).to eq('Hogarth Press')

      Reader::ListCreator.all_books.clear
      Reader::ListCreator.view_list.clear
    end
  end

  describe '.view_list' do
    it 'returns the reading list array' do
      book_1 = Reader::Book.new("The Well-Grounded Rubyist", "David A. Black", "Manning")
      
      Reader::ListCreator.add_to_reading_list(book_1)

      reading_list = Reader::ListCreator.view_list

      expect(reading_list).to be_a(Array)
      expect(reading_list.size).to eq(1)

      Reader::ListCreator.all_books.clear
      Reader::ListCreator.view_list.clear
    end
  end
end
