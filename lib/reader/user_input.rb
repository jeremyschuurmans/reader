class Reader::UserInput
  SELECTIONS = ['1', '2', '3', '4', '5']

  def initialize(input: $stdin)
    @input = input
  end
      
  def get_input
    @input = @input.gets.chomp.downcase

    if @input.length == 1 && SELECTIONS.include?(@input)
      @input = @input.to_i-1
    end
    @input
  end
end
