class AddStreetNoToSpreeAddress < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :street_no, :string
  end
end
