require "digest/sha1"
require "json"

module Passbook
  class Manifest

    def initialize(*files)
      @files = Array(files).flatten.compact
    end
    
    def filename
      "manifest.json"
    end
    
    def content
      to_h.to_json
    end
    
    def to_h
      @files.each_with_object({}) do |file, dict|
        dict[file.filename] = sign(file.content)
      end
    end
    
    def sign(content)
      Digest::SHA1.hexdigest(content)
    end

  end
end