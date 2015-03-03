require 'spec_helper'

describe Spree::Address, type: :model do
  describe 'instance methods' do
    it 'responds to street_no' do
      address = Spree::Address.new
      expect(address).to respond_to(:street_no)
    end
  end

  describe 'validations' do
    context 'with a street_no' do
      it 'is valid' do
        address = Spree::Address.new(
          street_no: '12a',
          address1: 'Beispielstraße',
          firstname: 'Hans',
          lastname: 'Mustermann',
          city: 'Hamburg',
          zipcode: '22343',
          phone: '123',
          country: create(:country)
        )
        expect(address).to be_valid
      end
    end
    context 'without a street_no' do
      it 'is invalid' do
        address = Spree::Address.new(
          address1: 'Beispielstraße',
          firstname: 'Hans',
          lastname: 'Mustermann',
          city: 'Hamburg',
          zipcode: '22343',
          phone: '123',
          country: create(:country)
        )
        expect(address).to_not be_valid
      end
    end
  end
end
