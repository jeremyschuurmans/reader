require 'spec_helper'
require 'pry'

RSpec.describe Reader::UserInput do
  describe '#input_from_user' do
    it 'receives input from user and returns it chomped and downcased' do
      input = StringIO.new("Ruby\n")

      user_input = Reader::UserInput.new(input)

      expect(user_input.input_from_user).to eql('ruby')
    end
  end
end
