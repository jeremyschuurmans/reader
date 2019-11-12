class Reader::CLI
  def initialize
    puts "Welcome to Reader!"
  end

  def call
    get_books

    user_input = nil
    
    while user_input != 'exit'
      user_input = Reader::UserInput.new.get_input

      case user_input
      when 'search'
        get_books
      when user_input.is_a?(Integer) 
        save_book
      when 'list'
        view_list
      when 'prev'
        display_books
      end
    end
    puts "Goodbye!"
  end

  def get_books
    clear_search

    puts "Enter a word or phrase to find some books:"

    user_input = Reader::UserInput.new.get_input
    
    Reader::GetBook.from_google_books(user_input)

    display_books
  end

  def display_books
    books = Reader::ListCreator.all_books

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
    index      = Reader::UserInput.new.get_input
    book       = Reader::ListCreator.all_books[index]

    Reader::ListCreator.add_to_reading_list(book)

    puts "Saved!"
    puts ""
    puts "To view your previous search, enter 'prev'"
    puts "To view your reading list, enter 'list'"
    puts "To search again, enter 'search'"
    puts "To exit, enter 'exit'"
  end

  def view_list
    list = Reader::ListCreator.view_list
    
    puts ""
    puts "MY READING LIST"

    list.each.with_index(1) do |list_item, index|
      puts "#{index} - Title: #{list_item.title}"
      puts "           #{list_item.subtitle}" if list_item.subtitle != nil
      puts "    Author: #{list_item.author}"
      puts "    Publisher: #{list_item.publisher}"
      puts ""
    end

    puts "To view your previous search, enter 'prev'"
    puts "To search again, enter 'search'"
  end

  def clear_search
    Reader::ListCreator.all_books.clear
  end
end
