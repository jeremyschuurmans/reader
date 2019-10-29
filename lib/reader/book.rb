class Reader::Book
  attr_accessor :title, :author, :publisher

  def initialize(title, author, publisher)
    @title = title
    @author = author
    @publisher = publisher
  end

end
