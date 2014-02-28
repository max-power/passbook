require "openssl"
require "base64"

module Passbook
  module Authorizer
    module_function
    
    def sign(content)
      wwdr = OpenSSL::X509::Certificate.new(Passbook.wwdr_certificate)
      pk12 = OpenSSL::PKCS12.new(Passbook.certificate, Passbook.password)
      flag = OpenSSL::PKCS7::BINARY | OpenSSL::PKCS7::DETACHED
      OpenSSL::PKCS7.sign(pk12.certificate, pk12.key, content, [wwdr], flag).to_der
    end
  end
end