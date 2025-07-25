require 'rails_helper'

RSpec.describe "Rents", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/rents/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/rents/create"
      expect(response).to have_http_status(:success)
    end
  end

end
