# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "Provision Vault" do

  before do
    @id = "1234-5678"
  end

  def provision_request
    put "/v2/service_instances/#{@id}"
  end

  context "if auth credentials are missing" do
    it "returns a 401 unauthorized response" do
      provision_request
      expect(last_response.status).to eq(401)
    end
  end

  context "if auth credentials are incorrect" do
    it "returns a 401 unauthorized response" do
      authorize "wrong-user", "wrong-password"
      provision_request
      expect(last_response.status).to eq(401)
    end
  end

  context "if auth credentials are correct" do
    before do
      authorize "admin", "admin"
      provision_request
    end

    it "returns a 202 accepted response" do
      expect(last_response.status).to eq(202)
    end
   end
   
end