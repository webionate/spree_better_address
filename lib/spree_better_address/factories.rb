FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_better_address/factories'
end
FactoryGirl.modify do
  factory :address, aliases: [:bill_address, :ship_address] do
    address1 'Lovely Street'
    street_no '12'
  end
end
