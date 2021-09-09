module Spree
  module Api
    module V2
      class ActiveSaleEventsController < Spree::Api::V2::ResourceOwnerController
        def collection
          Spree::ActiveSaleEvent.active
        end

        def collection_serializer
          Spree::V2::ActiveSaleEventSerializer
        end
      end
    end
  end
end
