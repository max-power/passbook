require "digest/sha1"
require "json"

module Passbook
  class Manifest
    def initialize(*files)
      @files = files.flatten.compact
    end
    
    def filename
      "manifest.json"
    end
    
    def content
      dictionary.to_json
    end
    
    def dictionary
      @files.each_with_object({}) do |file, dict|
        dict[file.filename] = Digest::SHA1.hexdigest(file.content)
      end
    end
  end
end