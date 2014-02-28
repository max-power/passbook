require "passbook/static_file"
require "passbook/remote_file"

module Passbook
  class Assets < Array
    def initialize(dict)
      super dict.map do |name, path|
        (path =~ %r[^https?://\S+] ? RemoteFile : StaticFile).new(name, path)
      end
    end
  end
end