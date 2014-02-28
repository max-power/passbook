require "passbook/static_file"
require "passbook/remote_file"

module Passbook
  class Assets < Array
    def initialize(dict)
      super dict.map { |n,p| (p =~ %r[^https?://\S+] ? RemoteFile : StaticFile).new(n,p) }
    end
  end
end