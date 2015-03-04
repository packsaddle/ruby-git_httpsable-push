module GitHttpsable
  module Push
    class Repository
      def initialize(path, options = {})
        @path = path
        @options = options
      end

      def push(remote = 'origin', branch = 'master', options = {})
        # check current branch's upstream remote and branch?
        if !git.remote(remote) || !git.remote(remote).url
          fail NotExistRemoteUrlError, %(no "#{remote}" url)
        end
        url = git.remote(remote).url

        logger.debug(remote: converted_url, branch: branch, options: options)
      end

      def logger
        ::GitHttpsable::Push.logger
      end

      def git
        @git ||= ::Git.open(@path, @options)
      end

      def remote_url(remote)
        git.remote(remote) && git.remote(remote).url
      end
    end
  end
end
