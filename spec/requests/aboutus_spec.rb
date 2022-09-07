require 'rails_helper'

RSpec.describe "Aboutus", type: :request do
  describe "GET /hello" do
    it "returns http success" do
      get "/aboutus/hello"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /goodbye" do
    it "returns http success" do
      get "/aboutus/goodbye"
      expect(response).to have_http_status(:success)
    end
  end

end
