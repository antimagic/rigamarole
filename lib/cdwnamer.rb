require 'colorize'
require 'yaml'

class CdwNamer
  attr_accessor :name
  attr_accessor :topic
  attr_accessor :topics
  attr_accessor :assignment

  def initialize
    config = self.loadConfig
    @name = config["name"]
    @topics = config["topics"]
    @topic = self.getTopic
    @assignment = self.getAssignment
  end

  def filename
    return "#{self.name}_SCME#{self.topic}_#{self.topics[self.topic]}_#{self.assignment}"
  end

  def getTopic
    code = ARGV[0]
    if code.nil?
      puts "Come on man, give me a topic code.".red
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

  # Loads the config.yaml from the execution dir and grabs its cdwnamer object.
  # Sensible errors if it can't find it or the cdwnamer key isn't there.
  def loadConfig
    begin
      config = YAML.load_file("config.yaml")
    rescue StandardError => err
      puts "Couldn't load config.yaml from #{Dir.pwd}. Does it exist?".red
      exit
    end

    if config.key?("cdwnamer")
      return config["cdwnamer"]
    end

    puts "config.yaml didn't contain settings for cdwnamer. Check the config.yaml.example!".red
    exit
  end
end