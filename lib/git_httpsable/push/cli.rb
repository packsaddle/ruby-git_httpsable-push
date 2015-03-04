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

      desc 'push', 'Git Push via HTTPS'
      option :debug, type: :boolean, default: false
      option :verbose, type: :boolean, default: false
      option :force, type: :boolean, default: false, aliases: '-f'
      option :tags, type: :boolean, default: false
      def push(*args)
        setup_logger(options)

        puts 'push :)'
        puts args
      rescue StandardError => e
        suggest_messages(options)
        raise e
      end
      default_command :push

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
          logger.error 'Have a question? Please ask us:'
          logger.error ISSUE_URL
          logger.error 'options:'
          logger.error options
        end

        # http://stackoverflow.com/a/23955971/104080
        def method_missing(method, *args)
          self.class.start([self.class.default_command, method.to_s] + args)
        end
      end
    end
  end
end
