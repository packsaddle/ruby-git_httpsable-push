require 'thor'

module GitHttpsable
  module Push
    class CLI < Thor
      def self.exit_on_failure?
        true
      end

      desc 'version', 'Show the GitHttpsable::Push version'
      map %w(-v --version) => :version

      def version
        puts "GitHttpsable::Push version #{::GitHttpsable::Push::VERSION}"
      end

      no_commands do
        def logger
          ::GitHttpsable::Push.logger
        end

        def setup_logger(options)
          if options[:debug]
            logger.level = Logger::DEBUG
          elsif options[:verbose]
            logger.level = Logger::INFO
          end
          logger.debug(options)
        end

        def suggest_messages(options)
          logger.error 'Have a question? Please ask me:'
          logger.error ISSUE_URL
          logger.error 'options:'
          logger.error options
        end
      end
    end
  end
end
