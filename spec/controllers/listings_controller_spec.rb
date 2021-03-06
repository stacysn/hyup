require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
  describe "#create" do
    it "creates new listing" do
      listing_params = {
        address: "123 Fake St. San Francisco, CA 94111",
        title: "Nice Apartment",
        rent: "$900",
        available_date: "02-04-2018",
        description: "Great View",
        contact_phone: '123-456-7891',
        contact_email: "gilligan@island.net",
        picture_file_name: 'room-controller-valid.jpg',
        city: "San Francsico"
      }
      post :create, params: { listing: listing_params }
      expect(Listing.count).to eq(1)
    end
  end
  describe "GET #index" do
    it "assigns @listings" do
      all_listings = Listing.all
      get :index
      expect(assigns(:listings)).to eq(all_listings)
    end
  end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
end
