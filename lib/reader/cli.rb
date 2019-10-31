class Reader::CLI
  require 'pry'

  def initialize
    puts "Welcome to Reader!"
    puts "To find a book to read, type a word or phrase:"
  end

  def call
   get_books
  end

  def get_books
    user_input = gets.chomp
    Reader::GetBook.from_google_books(user_input)
    display_books
  end

  def display_books
    books = Reader::Book.all

    books.each.with_index(1) do |book, index|
      puts "#{index} - Title: #{book.title}"
      puts "           #{book.subtitle}" if book.subtitle != nil
      puts "    Author: #{book.author}"
      puts "    Publisher: #{book.publisher}"
    end
  end

end
