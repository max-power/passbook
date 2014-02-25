require 'spec_helper'

describe Passbook::RemoteFile do
  before do
    @file = Passbook::RemoteFile.new('test.txt', 'http://www.last.fm/robots.txt')
  end
  
  it "should have a filename" do
    @file.filename.must_equal 'test.txt'
  end
  
  it "should have content" do
    @file.content.must_equal 'User-Agent: *
Disallow: /music?
Disallow: /widgets/radio?

Disallow: /affiliate/
Disallow: /affiliate_redirect.php
Disallow: /affiliate_sendto.php
Disallow: /affiliatelink.php
Disallow: /campaignlink.php
Disallow: /delivery.php

Disallow: /music/+noredirect/
Disallow: /user/*/library/music/
Disallow: /*/+news/*/visit
Disallow: /*/+wiki/diff

# AJAX content
Disallow: /search/autocomplete
Disallow: /template
Disallow: /ajax
Disallow: /user/*/tasteomatic

# Ads metastructure
Disallow: /8264

Disallow: /harming/humans
Disallow: /ignoring/human/orders
Disallow: /harm/to/self

Allow: /

Sitemap: http://www.last.fm/sitemap-index.xml
'
  end
end