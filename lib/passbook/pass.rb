require "json"

module Passbook
  class Pass
    def initialize(specs, defaults = {})
      @specs = specs.merge(defaults)
    end
    
    def filename
      "pass.json"
    end
    
    def content
      @specs.to_json
    end
  end
end