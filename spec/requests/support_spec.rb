require 'rails_helper'

RSpec.describe "Supports", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/support"
      expect(response).to have_http_status(:success)
    end
  end

end
