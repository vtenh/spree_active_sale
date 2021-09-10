require 'spec_helper'

RSpec.describe Spree::Api::V2::ActiveSaleEventsController, type: :controller do
  routes { Spree::Core::Engine.routes }

  describe "GET index" do
    it "lists all active sale events with status active" do
      Spree::ActiveSale.destroy_all
      active_sale_event = create(:active_sale_event)
      product = create(:product)
      sale_product = create(:sale_product, product: product, active_sale_event: active_sale_event)

      get :index, params: { "include" => "highlight_products" }

      expect(response.status).to eq(200)
      json_response = JSON.parse(response.body)
      expect(json_response["data"][0]["id"]).to eq(active_sale_event.id.to_s)
      expect(json_response["data"][0]["attributes"]).to eq({
        "description" => active_sale_event.description,
        "discount" => nil,
        "end_date" => active_sale_event.end_date.iso8601(3),
        "name" => active_sale_event.name,
        "start_date" => active_sale_event.start_date.iso8601(3)
      })
    end
  end
end
