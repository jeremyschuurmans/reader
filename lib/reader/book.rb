class Reader::Book
  attr_accessor :title, :subtitle, :author, :publisher

  @@books = []

  def initialize(title, subtitle = nil, author, publisher)
    @title     = title
    @subtitle  = subtitle # defaults to nil in case some books don't have a subtitle.
    @author    = author
    @publisher = publisher
    @@books << self
  end

  def self.all
    @@books
  end

  def self.clear
    @@books = []
  end
end
