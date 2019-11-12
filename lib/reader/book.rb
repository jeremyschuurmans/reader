class Reader::Book
  attr_reader :title, :subtitle, :author, :publisher

  def initialize(title, subtitle = nil, author, publisher)
    @title     = title
    @subtitle  = subtitle # defaults to nil in case some books don't have a subtitle.
    @author    = author
    @publisher = publisher
    
    Reader::ListCreator.create_list(self)
  end
end
