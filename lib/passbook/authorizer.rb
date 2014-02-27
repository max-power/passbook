require "openssl"
require "base64"

module Passbook
  module Authorizer
    module_function
    
    def sign(content)
      wwdr = OpenSSL::X509::Certificate.new(Passbook.wwdr_certificate)
      pk12 = OpenSSL::PKCS12.new(Passbook.certificate, Passbook.password)
      flag = OpenSSL::PKCS7::BINARY | OpenSSL::PKCS7::DETACHED
      sign = OpenSSL::PKCS7.sign(pk12.certificate, pk12.key, content, [wwdr], flag)
      data = OpenSSL::PKCS7.write_smime(sign)
      Base64.decode64 extract_smime(data)
    end
    
    def extract_smime(data)
      start, finish = %[filename="smime.p7s"\n\n], %[\n\n------]
      data[(data.index(start) + start.length)...(data.rindex(finish) + finish.length)]
    end
  end
end