require 'spec_helper'

describe 'update an address' do
  stub_authorization!
  scenario 'update an address on an order' do
    order = create(:completed_order_with_totals)
    visit spree.edit_admin_order_customer_path(order)
    fill_in 'order[bill_address_attributes][street_no]', with: '143 a'
    fill_in 'order[bill_address_attributes][phone]', with: ''
    fill_in 'order[ship_address_attributes][street_no]', with: '43'
    fill_in 'order[ship_address_attributes][phone]', with: ''
    within '.edit_order' do
      find('button[type="submit"]').click
    end
    order.reload
    expect(order.bill_address.street_no).to eq '143 a'
    expect(order.bill_address.phone).to eq ''
    expect(order.ship_address.street_no).to eq '43'
    expect(order.ship_address.phone).to eq ''

  end
end
