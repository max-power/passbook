# Passbook

This is inspired by https://github.com/paperlesspost/passifier which i couldn't get to run with p12 signing.
So here is my take on iOS Passbook passes.

## Installation

Add this line to your application's Gemfile:

    gem 'power-passbook', github: 'max-power/passbook'

And then execute:

    $ bundle

## Usage

First setup Signing:

    Passbook.certificate = File.read("/path/to/certificate.p12")
    Passbook.password    = "my-password-for-the-certificate"

The basic usage is:
  
    Passbook::PKPass.new(pass_specifications, pass_assets)
    
It can also accept a third argument, which will get merged with the pass_specifications
It is useful to store default informations like passTypeIdentifier or teamIdentifier

    Passbook::PKPass.new(pass_specifications, pass_assets, {teamIdentifier: 'YXYXYX123', serialNumber: 1234.next })

Pass specifications is a hash that should match the Apple Passbook Format Reference
https://developer.apple.com/library/ios/documentation/UserExperience/Reference/PassKit_Bundle/Chapters/TopLevel.html

    pass_specifications = {
      "formatVersion"      => 1,
      "passTypeIdentifier" => "pass.com.flycheap.boardingpass",
      "teamIdentifier"     => "XXXXXXXX",
      "organizationName"   => "XXXXXXXX",
      "labelColor"         => "#ffffff",
      "backgroundColor"    => "#618d04",
      "foregroundColor"    => "#ffffff",
      "serialNumber"       => "123",
      "logoText"           => "Hi",
      ...
    }
    
The assets parameter is a hash with filenames as keys and local or remote paths to the file as value

    pass_assets = {
      "background.png"    => "assets/background.png",
      "background@2x.png" => "assets/background@2x.png",
      "icon.png"          => "assets/icon.png",
      "icon@2x.png"       => "assets/icon@2x.png",
      "logo.png"          => "http://i.imgur.com/WLUf6.png",
      "logo@2x.png"       => "http://i.imgur.com/mOpQo.png",
      "thumbnail.png"     => "assets/thumbnail.png",
      "thumbnail@2x.png"  => "assets/thumbnail@2x.png"
    }

    pass = Passbook::PKPass.new(pass_specifications, pass_assets)
    
    pass.content_type # "application/vnd.apple.pkpass"
    pass.to_file("my/path/to/the/pass.pkpass")
    pass.to_s

## Contributing

1. Fork it ( http://github.com/max-power/passbook/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
