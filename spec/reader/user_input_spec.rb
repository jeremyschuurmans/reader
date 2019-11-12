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
      input = StringIO.new("1\n")

      user_input = Reader::UserInput.new(input)

      expect(user_input.convert_input).to eq(1)
    end
  end
end
