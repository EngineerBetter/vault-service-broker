# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "Vault Service Broker" do

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

     it "returns json as the content type" do
       expect(last_response.header["Content-Type"]).to include("application/json")
     end

   end

 end
end
