# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "Vault Service Broker" do

  describe "Get Catalog" do

   context "if a catalog request is made" do
    it "returns an ok" do
      get '/v2/catalog'
      expect(last_response).to be_ok
    end
   end


  end
end
