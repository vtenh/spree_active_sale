module Spree
  class SaleProperty < ActiveRecord::Base
    belongs_to :active_sale_event
    belongs_to :property

    validates :property, :presence => true
    validates :value, :length => { :maximum => 255 }

    attr_accessor :property_name, :value, :position

    default_scope { order("#{self.table_name}.position") }

    # virtual attributes for use with AJAX completion stuff
    def property_name
      property.name if property
    end

    def property_name=(name)
      unless name.blank?
        unless property = Property.find_by_name(name)
          property = Property.create(:name => name, :presentation => name)
        end
        self.property = property
      end
    end
  end
end
