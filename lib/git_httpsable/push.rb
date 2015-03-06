require 'logger'
require 'git'
require 'uri'
require 'git_clone_url'

require 'git_httpsable/push/error'
require 'git_httpsable/push/repository'
require 'git_httpsable/push/version'

module GitHttpsable
  module Push
    ISSUE_URL = 'https://github.com/packsaddle/ruby-git_httpsable-push/issues/new'
    def self.default_logger
      original_formatter = Logger::Formatter.new
      logger = Logger.new(STDERR)
      logger.progname = 'GitHttpsable::Push'
      logger.level = Logger::WARN
      logger.formatter = proc { |severity, datetime, progname, msg|
        original_formatter.call(severity, datetime, progname, msg.to_s.gsub(%r{://[^/@]*@}) { '://MASKED@' })
      }
      logger
    end

    def self.logger
      return @logger if @logger
      @logger = default_logger
    end

    class << self
      attr_writer :logger
    end
  end
end
