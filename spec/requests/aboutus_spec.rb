require 'rails_helper'

RSpec.describe "Aboutus", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/aboutus/index"
      expect(response).to have_http_status(:success)
    end
  end

  

end
