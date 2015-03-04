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
        fail NotExistRemoteUrlError, %(no "#{remote}" url) unless url
        converted_url = build_https_url(url, auth_data)

        logger.debug(remote: converted_url, branch: branch, options: options)
      end

      def build_https_url(base_url, auth_data)

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
        ENV['GIT_ACCESS_TOKEN']
      end

      def auth_data
        if env_git_access_token
          env_git_access_token
        elsif env_github_access_token
          "#{env_github_access_token}:x-oauth-basic"
        else
          fail NoAuthDataError
        end
      end

      def env_hosting
        ENV['GIT_HOSTING']
      end

      def host(host)
        env_hosting || host
      end
    end
  end
end
