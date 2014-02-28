module Passbook
  class Signature
    def initialize(manifest, authority)
      @manifest, @authority = manifest, authority
    end
    
    def filename
      "signature"
    end
    
    def content
      @content ||= @authority.sign(@manifest.content)
    end
  end
end
