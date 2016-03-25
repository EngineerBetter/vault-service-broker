require "broker_api"

describe Service_catalog do

  describe "#get" do

   context "if no message was passed" do
    it "returns a default string" do
      expect(Service_catalog.new.get(nil)).to eq "this is the default string"
    end
   end

   context "if a message is passed" do
    it "returns the message" do
      expect(Service_catalog.new.get("foobar barfoo")).to eq "foobar barfoo"
    end

   end
  end
end
