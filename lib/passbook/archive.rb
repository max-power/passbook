require "zip"

module Passbook
  module Archive
    module_function
    
    def zip(*files)
      Zip::OutputStream.write_buffer do |zip|
        files.flatten.compact.each do |file|
          zip.put_next_entry(file.filename) && zip.write(file.content)
        end
      end
    end
  end
end