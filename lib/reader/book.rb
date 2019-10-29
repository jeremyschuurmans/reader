class Reader::Book
  attr_accessor :title, :author, :publisher

  @@all = {}

  def initialize(params)
    @title = params[:title]
    @author = params[:author]
    @publisher = params[:publisher]
  end

end
