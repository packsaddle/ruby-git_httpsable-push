module GitHttpsable
  module Push
    class GitHttpsablePushError < StandardError; end
    class NotExistRemoteUrlError < GitHttpsablePushError; end
    class NoAuthDataError < GitHttpsablePushError; end
  end
end
