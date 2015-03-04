module Spree
  Address.class_eval do
    validates :street_no, presence: true

    def require_phone?
      false
    end
  end
end
