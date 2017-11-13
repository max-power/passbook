require 'spec_helper'

describe Passbook::PKPass do
  before do
    @pass = Passbook::PKPass.new({},{},{})
  end
  
  it "should have the 'vnd.apple.pkpass' content_type" do
    @pass.content_type.must_equal 'application/vnd.apple.pkpass'
  end
  
end
