require "catalog"

describe Catalog do
  describe "#get" do
   context "if no message was passed" do
    it "returns a default string" do
      expect(Catalog.new.get(nil)).to eq "this is the default string"
    end
   end
  end
end
