module Spree
  module V2
    module ActiveSale
      class CoverImageSerializer < BaseSerializer
        set_type :cover_image

        attributes :viewable_type, :viewable_id, :styles
      end
    end
  end
end

