require 'spec_helper'

describe Passbook::Pass do
  before do
    @pass = Passbook::Pass.new({ a: '123', serialNumber: 'xtc1001' })
  end
  
  it "should have a filename" do
    @pass.filename.must_equal 'pass.json'
  end
  
  it "should have content" do
    @pass.content.must_equal %Q[{"a":"123","serialNumber":"xtc1001"}]
  end
end