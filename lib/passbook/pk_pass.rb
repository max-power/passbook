require "passbook/pass"
require "passbook/assets"
require "passbook/manifest"
require "passbook/signature"
require "passbook/archive"

module Passbook
  class PKPass
    def initialize(specs, assets, authority)
      @pass      = Pass.new(specs)
      @assets    = Assets.new(assets)
      @manifest  = Manifest.new(@pass, @assets)
      @signature = Signature.new(@manifest, authority)
    end
    
    def content_type
      "application/vnd.apple.pkpass"
    end
    
    def to_s
      Archive.zip(@pass, @assets, @manifest, @signature).string
    end
    
    def to_file(path)
      File.write(path, to_s)
    end
  end
end