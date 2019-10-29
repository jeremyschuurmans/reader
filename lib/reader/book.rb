class Reader::Book
  attr_accessor :title, :author, :publisher

  @@books = []

  def initialize(title, author, publisher)
    @title = title
    @author = author
    @publisher = publisher
    @@books << self
  end

  def self.all
    @@books
  end
end


