require 'spec_helper'

describe Passbook::Manifest do
  before do
    @manifest = Passbook::Manifest.new({}, {})
  end
  
  it "should have a filename" do
    @manifest.filename.must_equal "manifest.json"
  end
end