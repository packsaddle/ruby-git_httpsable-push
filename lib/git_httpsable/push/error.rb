module GitHttpsable
  module Push
    class GitHttpsablePushError < StandardError
      def exception(error_message = nil)
        return self if error_message.nil?
        self.class.new('filtered' + error_message)
      end
    end
    class NotExistRemoteUrlError < GitHttpsablePushError; end
    class NoAuthDataError < GitHttpsablePushError; end
  end
end
