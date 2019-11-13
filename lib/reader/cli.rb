class Reader::CLI
  def initialize
    puts ""
    puts "Welcome to Reader!"
    puts ""
  end

  def call
    get_books

    user_input = nil
    
    while user_input != 'exit'
      user_input = Reader::UserInput.new.get_input

      case user_input
      when 'search'
        get_books
      when 'list'
        view_list
      when 'prev'
        display_books
      else
        unless user_input == 'exit'
          puts ""
          puts "Invalid input. Please try again."
          puts ""

          user_prompts
        end
      end
    end
    puts ""
    puts "Goodbye!"
  end

  def get_books
    clear_search

    puts "Enter a word or phrase to find some books:"
    puts ""

    user_input = Reader::UserInput.new.get_input
    
    Reader::GetBook.from_google_books(user_input)

    display_books
  end

  def display_books
    books = Reader::List.all_books

    puts ""

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

    index  = Reader::UserInput.new.get_input

    if index.is_a?(Integer)
      book = Reader::List.all_books[index]

      Reader::List.add_to_reading_list(book)

      puts ""
      puts "Saved!"
      puts ""

      user_prompts
    else
      puts ""
      puts "You must enter a number to save a book. Enter 'prev' to view your previous search and save books."
      puts ""

      user_prompts
    end
  end

  def view_list
    list = Reader::List.view_list
    
    puts ""
    puts "MY READING LIST"
    puts ""

    list.each.with_index(1) do |list_item, index|
      puts "#{index} - Title: #{list_item.title}"
      puts "           #{list_item.subtitle}" if list_item.subtitle != nil
      puts "    Author: #{list_item.author}"
      puts "    Publisher: #{list_item.publisher}"
      puts ""
      puts ""
      puts ""
    end
    user_prompts
  end

  def user_prompts
    puts "To view your previous search, enter 'prev'"
    puts "To view your reading list, enter 'list'"
    puts "To search again, enter 'search'"
    puts "To exit, enter 'exit'"
  end

  def clear_search
    Reader::List.all_books.clear
  end
end
