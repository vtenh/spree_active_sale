module Spree
  module Api
    module V2
      class ActiveSaleEventsController < ResourceController
        def collection
          # params["include"] = "product"
          Spree::ActiveSaleEvent.active.includes(:highlight_products, sale_images: :attachment_blob)
        end

        def collection_serializer
          Spree::V2::ActiveSale::ActiveSaleEventSerializer
        end
      end
    end
  end
end
