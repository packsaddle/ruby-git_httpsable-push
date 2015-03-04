module GitHttpsable
  module Push
    class Repository
      def push(remote = 'origin', branch = 'master', options = {})
        logger.debug(remote: remote, branch: branch, options: options)
      end
    end
  end
end
