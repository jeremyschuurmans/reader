require 'spec_helper'
require 'pry'

RSpec.describe Reader::UserInput do
  describe '#get_input' do
    it 'receives input from user and returns it chomped and downcased' do
      mock_input = StringIO.new("Ruby\n")

      user_input = Reader::UserInput.new(input: mock_input)

      expect(user_input.get_input).to eq('ruby')
    end

    it "converts strings '1' through '5' to integers and substracts 1, returns all other input as a string" do
      mock_number_one     = StringIO.new("1")
      mock_number_five    = StringIO.new("5")
      mock_number_six     = StringIO.new("6")
      mock_not_a_number   = StringIO.new("cherry pie")

      user_input_one  = Reader::UserInput.new(input: mock_number_one)
      user_input_five = Reader::UserInput.new(input: mock_number_five)
      user_input_six  = Reader::UserInput.new(input: mock_number_six)
      user_input_nan  = Reader::UserInput.new(input: mock_not_a_number)

      expect(user_input_one.get_input).to eq(0)
      expect(user_input_five.get_input).to eq(4)
      expect(user_input_six.get_input).to eq("6")
      expect(user_input_nan.get_input).to eq("cherry pie")
    end
  end
end
