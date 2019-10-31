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
  end


end
