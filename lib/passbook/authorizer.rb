require "openssl"
require "base64"

module Passbook
  module Authorizer
    
    module_function
    
    def sign(content)
      Base64.decode64 extract(p7(content))
    end
    
    def extract(data)
      start, finish = %{filename="smime.p7s"\n\n}, "\n\n------"
      data[(data.index(start) + start.length)...(data.rindex(finish) + finish.length)]
    end
    
    def p7(content)
      data = OpenSSL::PKCS7.sign(p12.certificate, p12.key, content, [wwdr], flags)
      OpenSSL::PKCS7.write_smime data
    end
    
    def p12
      OpenSSL::PKCS12.new(Passbook.certificate.read, Passbook.password)
    end
    
    def wwdr
      OpenSSL::X509::Certificate.new(Passbook.wwdr_certificate.read)
    end
    
    def flags
      OpenSSL::PKCS7::BINARY | OpenSSL::PKCS7::DETACHED
    end
    
  end
end