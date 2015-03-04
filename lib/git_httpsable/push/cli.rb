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
    end
  end
end
