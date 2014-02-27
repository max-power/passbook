require "pathname"
require "passbook/pass"
require "passbook/assets"
require "passbook/manifest"
require "passbook/signature"
require "passbook/archive"

module Passbook
  class PKPass
    def initialize(specs, assets, defaults = {})
      @pass      = Pass.new(specs, defaults)
      @assets    = Assets.new(assets)
      @manifest  = Manifest.new(@pass, @assets)
      @signature = Signature.new(@manifest)
    end
    
    def content_type
      "application/vnd.apple.pkpass"
    end
    
    def content
      Archive.zip(@pass, @assets, @manifest, @signature)
    end

    def to_s
      content.string
    end
    
    def to_file(path)
      File.write(path, to_s)
    end
  end
end