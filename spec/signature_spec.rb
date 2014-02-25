require 'spec_helper'

describe Passbook::Signature do
  before do
    @sig = Passbook::Signature.new({})
  end
  
  it "should have a filename" do
    @sig.filename.must_equal 'signature'
  end
  
  it "should have content" do
#    @sig.content.must_equal 'TEST-1-2-3'
  end
end