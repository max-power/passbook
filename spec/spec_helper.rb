# -*- encoding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'

require 'minitest/autorun'
require 'minitest/spec'

require 'passbook'

Dummy = Struct.new(:filename, :content)