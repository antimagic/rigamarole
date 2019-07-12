#!/usr/bin/ruby

require 'colorize'
require 'clipboard'

class CdwNamer
  attr_accessor :name
  attr_accessor :topic
  attr_accessor :topics
  attr_accessor :assignment

  def initialize
    @name = "Firkins_James"
    @topics = {
      '1400' => "Bootcamp",
      '1402' => "IntroToDigitalPainting",
      '1403' => "IntroToCharacterDesign"
    }
    @topic = self.getTopic
    @assignment = self.getAssignment
  end

  def filename
    return "#{self.name}_SCME#{self.topic}_#{self.topics[self.topic]}_#{self.assignment}"
  end

  def getTopic
    code = ARGV[0]
    if code.nil?
      puts "Come on man give me a topic code.".red
      exit
    end
    
    unless self.topics.include?(code)
      puts "#{code} isn't a topic code I know about.".red
      exit
    end

    return code
  end

  def getAssignment
    return "FILLMEIN" if ARGV[1].nil?
    return ARGV[1]
  end
end

cdw = CdwNamer.new
puts cdw.filename.green
Clipboard.copy(cdw.filename)