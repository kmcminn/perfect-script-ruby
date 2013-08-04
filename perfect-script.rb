#!/usr/bin/env ruby
#encoding: utf-8
#
# perfect-script.rb - a ruby script template

SCRIPT_NAME = File.expand_path(__FILE__)
SCRIPT_DIR = File.dirname(SCRIPT_NAME)

$:.unshift SCRIPT_DIR unless $:.include? SCRIPT_DIR

require 'optparse'
require 'logger'
require 'ostruct'

module ScriptBase
  def setup_basic_options(options, banner=nil)
    oparse = OptionParser.new do |opts|
      opts.banner = banner ? banner : "Usage: #{__FILE__} [options]"
      opts.on('-h', '--help', 'Display this help') do
        self.usage
      end
      opts.on('-v', '--verbose', 'Turn on verbose') do
        options.verbose = true
        @log.level = Logger::DEBUG
      end
    end

    oparse
  end

  def setup_logging
    logger = Logger.new(STDOUT)
    logger.formatter = proc { |severity, datetime, progname, msg| "#{datetime} #{severity}: #{msg}\n" }
    logger.level = Logger::FATAL
    logger
  end

  def usage(error=nil)
    puts "Error: #{error}\n\n" if error
    puts @optparse
    exit 1
  end
end

class Script
  include ScriptBase
  attr_accessor :log, :options, :optparse

  def initialize
    @log = setup_logging()
    @options = OpenStruct.new 
    @optparse = setup_basic_options(@options)

  end
end

module ListFiles
  def list_files!(dir)
    out = `ls -al #{dir}`
    out 
  end 
end

class MyScript < Script
  include ListFiles

  def initialize
    super
    @optparse.define('-l LIST', '--list LIST', 'List some files') do |list|
      @options.list = list
    end

  end
end

def main!
  script = MyScript.new

  script.usage "You didn't specify any options" if not ARGV[0]
  script.optparse.parse! ARGV

  script.log.debug "Usage looks sane"
  script.log.debug "script.options.list: #{script.options.list}" if script.options.list

  puts script.list_files!(script.options.list) if script.options.list
end

main!() if __FILE__ == $0
