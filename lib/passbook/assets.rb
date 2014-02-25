require "passbook/static_file"
require "passbook/remote_file"

module Passbook
  class Assets < Array

    def initialize(dict)
      super dict.map { |name, path| member_class(path).new(name, path) }
    end
    
    private

    def member_class(path)
      path.to_s.match(%r[^https?://\S+]) ? RemoteFile : StaticFile
    end

  end
end