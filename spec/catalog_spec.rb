# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "Get Catalog" do

  def catalog_request
    get "/v2/catalog"
  end

  context "if auth credentials are missing" do
    it "returns a 401 unauthorized response" do
      catalog_request
      expect(last_response.status).to eq(401)
    end
  end

  context "if auth credentials are incorrect" do
    it "returns a 401 unauthorized response" do
      authorize "wrong-user", "wrong-password"
      catalog_request
      expect(last_response.status).to eq(401)
    end
  end

  context "if auth credentials are correct" do
    before do
      authorize "admin", "admin"
      catalog_request
    end

    it "returns a 200 unauthorized response" do
      expect(last_response.status).to eq(200)
    end

    it "returns JSON as the content type" do
      expect(last_response.header["Content-Type"]).to include("application/json")
    end

    it "returns a service with a valid set of attributes, with at least one plan" do
      response_json = JSON.parse last_response.body
      service_0 = response_json['services'][0]
      expect(service_0.keys).to include("id", "name", "description", "bindable", "tags", "metadata", "plans")
      expect(service_0['plans'][0].keys).to include("id", "name", "description")
    end

  end
 end
