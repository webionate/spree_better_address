require 'spec_helper'

describe 'address checkout step' do

  scenario "fill in a address and continue" do
    order = OrderWalkthrough.up_to(:address)
    user = create(:user)
    order.user = user
    order.update!
    allow_any_instance_of(Spree::CheckoutController).to receive_messages(:current_order => order)
    allow_any_instance_of(Spree::CheckoutController).to receive_messages(:try_spree_current_user => user)

    visit spree.checkout_state_path(:address)
    fill_in 'order[bill_address_attributes][street_no]', with: '143 a'
    fill_in 'order[bill_address_attributes][phone]', with: ''
    fill_in 'order[ship_address_attributes][street_no]', with: '43'
    fill_in 'order[ship_address_attributes][phone]', with: ''
    within '.edit_order' do
      find('input[type="submit"]').click
    end
    expect(page).to have_content('Shipping Method')
    order.reload
    expect(order.bill_address.street_no).to eq '143 a'
    expect(order.bill_address.phone).to eq ''
    expect(order.ship_address.street_no).to eq '43'
    expect(order.ship_address.phone).to eq ''
  end
end
