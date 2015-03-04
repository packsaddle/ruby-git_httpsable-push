module GitHttpsable
  module Push
    class Repository
      def push(remote = 'origin', branch = 'master', options = {})
        # check current branch's upstream remote and branch
        logger.debug(remote: remote, branch: branch, options: options)
      end

      def logger
        ::GitHttpsable::Push.logger
      end
    end
  end
end
