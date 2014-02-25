require 'spec_helper'

describe Passbook::Manifest do
  before do
    @manifest = Passbook::Manifest.new({}, {})
  end
  
  it "should have a filename" do
    @manifest.filename.must_equal "manifest.json"
  end
  
  it "should sign a string" do
    @manifest.sign('x').must_equal "11f6ad8ec52a2984abaafd7c3b516503785c2072"
  end
  
  # it "should have content" do
  #   @file.content.must_equal 'TEST-1-2-3'
  # end
end