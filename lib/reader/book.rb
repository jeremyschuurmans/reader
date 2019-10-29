class Reader::Book
  attr_accessor :title, :author, :publisher

  @@books = {}

  def initialize(params)
    @title = params[:title]
    @author = params[:author]
    @publisher = params[:publisher]
    @@books['title'] = @title
    @@books['author'] = @author
    @@books['publisher'] = @publisher
  end

  def self.all
    @@books
  end

end
