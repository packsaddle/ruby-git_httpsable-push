module GitHttpsable
  module Push
    class Repository
      def initialize(path, options = {})
        @path = path
        @options = options
      end

      def push(remote = 'origin', branch = 'master', options = {})
        # check current branch's upstream remote and branch?
        url = remote_url(remote)

        logger.debug(remote: converted_url, branch: branch, options: options)
      end

      def logger
        ::GitHttpsable::Push.logger
      end

      def git
        @git ||= ::Git.open(@path, @options)
      end

      def remote_url(remote)
        url = git.remote(remote) && git.remote(remote).url
        fail NotExistRemoteUrlError, %(no "#{remote}" url) unless url
        url
      end
    end
  end
end
