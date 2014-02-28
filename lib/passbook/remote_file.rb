require 'net/http'

module Passbook
  class RemoteFile
    attr_reader :filename

    def initialize(name, uri)
      @filename, @uri = name, URI(uri)
    end
    
    def content
      @content ||= Net::HTTP.get(@uri)
    end
  end
end