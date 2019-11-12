require 'spec_helper'
require 'pry'

RSpec.describe Reader::UserInput do
  describe '#input' do
    it 'receives input from user and returns it chomped and downcased' do
      mock_input = StringIO.new("Ruby\n")

      user_input = Reader::UserInput.new(input: mock_input)

      expect(user_input.input).to eq('ruby')
    end
  end

  describe '#input_to_integer' do
    it "converts strings '1' through '5' to integers and substracts 1, returns all other input as a string" do
      mock_number_one     = StringIO.new("1")
      mock_number_five    = StringIO.new("5")
      mock_number_six     = StringIO.new("6")
      mock_not_a_number   = StringIO.new("cherry pie")

      user_input_one  = Reader::UserInput.new(input: mock_number_one)
      user_input_five = Reader::UserInput.new(input: mock_number_five)
      user_input_six  = Reader::UserInput.new(input: mock_number_six)
      user_input_nan  = Reader::UserInput.new(input: mock_not_a_number)

      user_input_one.input
      user_input_five.input
      user_input_six.input
      user_input_nan.input

      expect(user_input_one.input_to_integer).to eq(0)
      expect(user_input_five.input_to_integer).to eq(4)
      expect(user_input_six.input_to_integer).to eq("6")
      expect(user_input_nan.input_to_integer).to eq("cherry pie")
    end
  end
end
