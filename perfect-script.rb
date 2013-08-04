#!/usr/bin/env ruby
#encoding: utf-8
#
# perfect-script.rb - a ruby script template

SCRIPT_NAME = File.expand_path(__FILE__)
SCRIPT_DIR = File.dirname(SCRIPT_NAME)

$:.unshift SCRIPT_DIR unless $:.include? SCRIPT_DIR

require 'optparse'
require 'logger'

module ScriptBase
  def setup_basic_options
    option = OptionParser.new do |opts|
      opts.banner = "Usage: #{__FILE__} [options]"
      opts.on('-h', '--help', 'Display this help') do
        usage
      end
    end

    option
  end

  def setup_logging
    logger = Logger.new(STDOUT)
    logger.formatter = proc { |severity, datetime, progname, msg| "#{datetime} #{severity}: #{msg}\n" }
    logger.level = Logger::FATAL

      #opts.on('-v', '--verbose', 'Turn on verbose') do
      #  @options[:verbose] = true
      #  @logger.level = Logger::DEBUG
      #end

    logger
  end

  def usage(error=nil)
    puts "Error: #{error}\n\n" if error
    puts @optparse
    exit 1
  end
end

module ListFiles
  def list_files!(dir)
    `ls -al #{dir}`
  end
end


class Script
  include ScriptBase
  attr_accessor :log, :options

  def initialize
    @log = setup_logging()
    @options = setup_basic_options()
  end
end

class MyScript < Script
  include ListFiles

  def initialize
    super
  end
end

def main()
  script = MyScript.new

  script.usage "You didn't specify any options" if not ARGV[0]
  script.options.parse!
  script.log.debug "Usage looks sane, invoking run!()"
  script.run!(script.options['path'])
end

main() if __FILE__ == $0
