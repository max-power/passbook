require "pathname"
require "passbook/version"
require "passbook/pk_pass"

module Passbook
  class << self

    attr_reader :certificate
    attr_accessor :password
    
    def wwdr_certificate
      Pathname('lib/wwdr.cer').realpath
    end
    
    def certificate=(path)
      Pathname(path).realpath
    end
    
    def configure
      yield self
      self
    end

  end
end
