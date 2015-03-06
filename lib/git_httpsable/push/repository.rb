module GitHttpsable
  module Push
    class Repository
      def initialize(path, options = {})
        @path = path
        @options = { log: logger }.merge(options)
      end

      def push(remote = 'origin', branch = 'master', options = {})
        logger.debug(remote: remote, branch: branch, options: options)
        # check current branch's upstream remote and branch?
        url = remote_url(remote)
        fail NotExistRemoteUrlError, %(no "#{remote}" url) unless url
        parsed = GitCloneUrl.parse(url)

        converted_url = \
          URI::Generic.build(
            scheme: scheme,
            userinfo: userinfo,
            host: host(parsed.host),
            port: port,
            path: parsed.path
          )
        git.push(converted_url.to_s, branch, options)
      rescue StandardError => e
        raise e if e.is_a?(GitHttpsablePushError)

        exception = GitHttpsablePushError.new('(' + e.class.name + ') ' + e.message)
        exception.set_backtrace(e.backtrace)
        raise exception
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

      def env_github_access_token
        ENV['GITHUB_ACCESS_TOKEN']
      end

      def env_git_access_token
        ENV['GIT_SERVER_ACCESS_TOKEN']
      end

      def userinfo
        if env_git_access_token
          env_git_access_token
        elsif env_github_access_token
          "#{env_github_access_token}:x-oauth-basic"
        else
          fail NoAuthDataError
        end
      end

      def scheme
        ENV['GIT_SERVER_SCHEME'] || 'https'
      end

      def host(host)
        ENV['GIT_SERVER_HOST'] || host
      end

      def port
        ENV['GIT_SERVER_PORT'] || nil
      end
    end
  end
end
