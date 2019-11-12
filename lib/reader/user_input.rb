class Reader::UserInput

  def initialize(input)
    @input = input
  end

  def input_from_user
    @input.gets.chomp.downcase
  end

  def convert_input
  end

end
