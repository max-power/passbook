require 'spec_helper'

describe Passbook::RemoteFile do
  before do
    @file = Passbook::RemoteFile.new('test.txt', 'http://www.last.fm/robots.txt')
  end
  
  it "should have a filename" do
    @file.filename.must_equal 'test.txt'
  end
  
  it "should have content" do
    @file.content.wont_be_nil
  end
end