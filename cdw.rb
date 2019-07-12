#!/usr/bin/ruby

require_relative 'lib/cdwnamer'
require 'colorize'
require 'clipboard'

cdw = CdwNamer.new
puts cdw.filename.green
Clipboard.copy(cdw.filename)