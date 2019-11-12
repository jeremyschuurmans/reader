class Reader::UserInput
  SELECTIONS = ['1', '2', '3', '4', '5']

  def initialize(input: $stdin)
    @input = input
  end
      
  def input
    @input = @input.gets.chomp.downcase
  end
      
  def input_to_integer
    if @input.length == 1 && SELECTIONS.include?(@input)
      @input = @input.to_i-1
    end
    @input
  end 
end
