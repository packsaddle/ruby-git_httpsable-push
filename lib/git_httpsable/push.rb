require 'logger'
require 'git'

require 'git_httpsable/push/repository'
require 'git_httpsable/push/version'

module GitHttpsable
  module Push
    ISSUE_URL = 'https://github.com/packsaddle/ruby-git_httpsable-push/issues/new'
    def self.default_logger
      logger = Logger.new(STDERR)
      logger.progname = 'GitHttpsable::Push'
      logger.level = Logger::WARN
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
