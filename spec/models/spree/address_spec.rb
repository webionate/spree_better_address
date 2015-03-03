require 'spec_helper'

describe Spree::Address, type: :model do
  describe 'instance methods' do
    it 'responds to street_no' do
      address = Spree::Address.new
      expect(address).to respond_to(:street_no)
    end
  end
end
