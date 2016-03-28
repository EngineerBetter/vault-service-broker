# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "Vault Service Broker" do

  describe "Get Catalog" do

   context "if a name is passed" do
    it "returns an ok" do
      get '/name'
      expect(last_response).to be_ok
    end
   end


  end
end
