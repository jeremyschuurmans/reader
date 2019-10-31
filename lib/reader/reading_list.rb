class Reader::ReadingList
  @@list = []

  def self.add_to_list(book)
    @@list << book
  end

  def self.view_list
    @@list
  end
end
