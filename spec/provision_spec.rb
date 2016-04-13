describe "Provisioning Vault" do
  before do
    @id = SecureRandom.uuid
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

    it "eventually says the instance is provisioned" do
      expect(last_response.status).to eq(202)
      get "/v2/service_instances/#{@id}"
      payload = JSON.parse(last_response.body)
      expect(payload.fetch('state')).to eq('succeeded')
    end


   end
   
end
