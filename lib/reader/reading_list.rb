class Reader::ListCreator
  @books        = []
  @reading_list = []
  
  def self.create_list(books)
    @books << books
  end
  
  def self.add_to_reading_list(book)
    @reading_list << book
  end

  def self.all_books
    @books
  end

  def self.view_list
    @reading_list
  end
end
