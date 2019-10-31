class Reader::CLI
  require 'pry'

  def initialize
    puts "Welcome to Reader!"
    puts "Would you like to find some books to read? y/n"
  end

  def call
    user_input = nil
    
    while user_input != 'exit'
      user_input = gets.chomp.downcase
      case user_input
      when 'y'
        get_books
      when user_input.to_i <= 5
        save_book
      end
    end
  end

  def get_books
    puts "Enter a word or phrase to find some books:"
    
    user_input = gets.chomp.downcase


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
      puts ""
    end
    save_book
  end

  def save_book
    puts "To save a book to your reading list, enter the corresponding number:"

    user_input = gets.chomp.downcase

    index = user_input.to_i-1

    book = Reader::Book.all[index]

    Reader::ReadingList.add_to_list(book)

    puts "Saved!"
  end

  def view_list
    list = Reader::ReadingList.all
    
    puts "MY READING LIST"

    list.each.with_index(1) do |list_item, index|
      puts "#{index} - Title: #{list_item.title}"
      puts "           #{list_item.subtitle}" if list_item.subtitle != nil
      puts "    Author: #{list_item.author}"
      puts "    Publisher: #{list_item.publisher}"
      puts ""
    end
  end





end
