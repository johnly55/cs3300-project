require 'rails_helper'

RSpec.describe "Products", type: :request do

  def valid_attributes 
    {:id=>1,:title => "title", :description => "Desc", :qty => 0}
  end

  describe "GET /index" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end
end
