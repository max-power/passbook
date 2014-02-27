require "passbook/authorizer"

module Passbook
  class Signature
    def initialize(manifest)
      @manifest = manifest
    end
    
    def filename
      "signature"
    end
    
    def content
      Authorizer.sign(@manifest.content)
    end
  end
end