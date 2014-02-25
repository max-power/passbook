require 'pathname'

module Passbook
  class StaticFile

    def initialize(name, path)
      @name, @path = name, Pathname(path)
    end
    
    def filename
      @name
    end
    
    def content
      @content ||= @path.read
    end

  end
end