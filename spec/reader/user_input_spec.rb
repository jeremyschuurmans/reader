require 'spec_helper'
require 'pry'

RSpec.describe Reader::UserInput do
  describe '#input_from_user' do
    it 'receives input from user and returns it chomped and downcased' do
      input = StringIO.new("Ruby\n")

      user_input = Reader::UserInput.new(input)

      expect(user_input.input_from_user).to eq('ruby')
    end
  end

  describe '#convert_input' do
    it "converts strings '1' through '5' to integers and substracts 1" do
      numerical_string     = "1"
      numerical_string_too = "5"

      numerical_input = Reader::UserInput.new(numerical_string)
      numerical_input_too = Reader::UserInput.new(numerical_string_too)

      expect(numerical_input.convert_input).to eq(0)
      expect(numerical_input_too.convert_input).to eq(4)
    end
  end
end
