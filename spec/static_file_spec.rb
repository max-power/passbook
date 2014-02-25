require 'spec_helper'

describe Passbook::StaticFile do
  before do
    @file = Passbook::StaticFile.new('icon.png', Pathname.new(__FILE__).dirname + 'files/test.txt')
  end
  
  it "should have a filename" do
    @file.filename.must_equal 'icon.png'
  end
  
  it "should have content" do
    @file.content.must_equal 'TEST-1-2-3'
  end
end