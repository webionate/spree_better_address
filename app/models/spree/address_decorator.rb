module Spree
  Address.class_eval do
    validates :street_no, presence: true
  end
end
