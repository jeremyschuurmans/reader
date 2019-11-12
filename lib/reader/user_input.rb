class Reader::UserInput
  SELECTIONS = ['1', '2', '3', '4', '5']

  def initialize(input)
    @input = input
  end

  def input_from_user
    @input.gets.chomp.downcase
  end

  def convert_input
    if @input.length == 1 && SELECTIONS.include?(@input)
      @input = @input.to_i-1
    end
    @input
  end

end
