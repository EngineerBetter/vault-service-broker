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
     it "returns a 200 unauthorized response" do
       authorize "admin", "admin"
       catalog_request
       expect(last_response.status).to eq(200)
     end
   end

 end
end
