module GitHttpsable
  module Push
    class Repository
      def initialize(path, options = {})
        @path = path
        @options = options
      end

      def push(remote = 'origin', branch = 'master', options = {})
        logger.debug(remote: remote, branch: branch, options: options)
        # check current branch's upstream remote and branch?
        url = remote_url(remote)
        fail NotExistRemoteUrlError, %(no "#{remote}" url) unless url
        parsed = git_clone_url_parse(url)

        converted_url = \
          URI::Generic.build(
            scheme: scheme,
            userinfo: userinfo,
            host: host(parsed.host),
            port: port,
            path: parsed.path
          )
        output = git.push(converted_url, branch, options)
        logger.info(output: output)
        output
      rescue URI::InvalidComponentError => e
        # require mask
        puts e.message
        puts e.backtrace
      rescue Git::GitExecuteError => e
        # require mask
        puts e.message
        puts e.backtrace
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

      def git_clone_url_parse(url)
        if URI::SshGit.ssh_protocol?(url)
          URI::SshGit.parse(url)
        else
          Addressable::URI.parse(url)
        end
      end
    end
  end
end
