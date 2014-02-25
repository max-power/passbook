require 'spec_helper'

describe Passbook::Assets do
  before do
    data = {
      "background.png" => "assets/background.png",
      "background@2x.png" => "assets/background@2x.png",
      "icon.png" => "assets/icon.png",
      "icon@2x.png" => "assets/icon@2x.png",
      "logo.png" => "http://i.imgur.com/WLUf6.png",
      "logo@2x.png" => "http://i.imgur.com/mOpQo.png",
      "thumbnail.png" => "assets/thumbnail.png",
      "thumbnail@2x.png" => "assets/thumbnail@2x.png"
    }
    @assets = Passbook::Assets.new(data)
  end
  
  it "should only contain remote or static files" do
    @assets.all? { |a| ['Passbook::StaticFile', 'Passbook::RemoteFile'].include?(a.class.name) }.must_equal true
  end
  
  it "should have 1 member" do
    @assets.length.must_equal 8
  end
end