require "pathname"

module Passbook
  class StaticFile
    attr_reader :filename
    
    def initialize(name, path)
      @filename, @path = name, Pathname(path)
    end
    
    def content
      @content ||= @path.read
    end
  end
end