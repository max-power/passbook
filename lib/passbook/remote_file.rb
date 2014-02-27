require 'net/http'

module Passbook
  class RemoteFile
    def initialize(name, uri)
      @name, @uri = name, URI(uri)
    end
    
    def filename
      @name
    end
    
    def content
      @content ||= Net::HTTP.get(@uri)
    end
  end
end