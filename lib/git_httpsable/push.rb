require 'logger'
require 'git'
require 'uri'
require 'git_clone_url'

require 'git_httpsable/push/error'
require 'git_httpsable/push/mask_logger'
require 'git_httpsable/push/repository'
require 'git_httpsable/push/version'

module GitHttpsable
  module Push
    ISSUE_URL = 'https://github.com/packsaddle/ruby-git_httpsable-push/issues/new'
    def self.default_logger
      MaskLogger.new($stderr)
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
