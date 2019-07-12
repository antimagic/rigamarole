#!/usr/bin/ruby

require 'colorize'

name = "Firkins_James"
topics = {
  '1400' => "Bootcamp",
  '1402' => "IntroToDigitalPainting"
}

def getAssignment(a)
  a = "FILLMEIN" if a.nil?
  return a
end

# ARGV gives you all the args
topic = ARGV[0]
if topic.nil?
  puts "Come on man give me a topic code.".red
  exit
end

assignment = getAssignment(ARGV[1])

unless topics.include?(topic)
  puts "#{topic} isn't a topic code I know about.".red
  exit
end

puts "#{name}_SCME#{topic}_#{topics[topic]}_#{assignment}"
