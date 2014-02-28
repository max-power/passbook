require "json"

module Passbook
  class Pass
    def initialize(specs)
      @specs = specs
    end
    
    def filename
      "pass.json"
    end
    
    def content
      @content ||= @specs.to_json
    end
  end
end