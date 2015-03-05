module GitHttpsable
  module Push
    class GitHttpsablePushError < StandardError
      def initialize(message = nil)
        return super unless message
        super(mask_token(message))
      end

      def mask_token(text)
        text.gsub(%r{://[^/@]*@}) { '://MASKED@' }
      end
    end

    class NotExistRemoteUrlError < GitHttpsablePushError; end
    class NotExistLocalBranchError < GitHttpsablePushError; end
    class NoAuthDataError < GitHttpsablePushError; end
  end
end
