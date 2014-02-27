require "openssl"
require "base64"

module Passbook
  module Authorizer
    module_function
    
    def sign(content)
      Base64.decode64 extract(p7_smime(p7_sign(content)))
    end
    
    def extract(data)
      start, finish = %[filename="smime.p7s"\n\n], %[\n\n------]
      data[(data.index(start) + start.length)...(data.rindex(finish) + finish.length)]
    end
    
    def p7_smime(data)
       OpenSSL::PKCS7.write_smime data
    end
    
    def p7_sign(content)
      OpenSSL::PKCS7.sign(p12.certificate, p12.key, content, [wwdr], flag)
    end
    
    def p12
      OpenSSL::PKCS12.new(Passbook.certificate, Passbook.password)
    end
    
    def wwdr
      OpenSSL::X509::Certificate.new(Passbook.wwdr_certificate)
    end
    
    def flag
      OpenSSL::PKCS7::BINARY | OpenSSL::PKCS7::DETACHED
    end
  end
end