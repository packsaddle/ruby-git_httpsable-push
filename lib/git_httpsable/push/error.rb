module GitHttpsable
  module Push
    class GitHttpsablePushError < StandardError; end
    class NotExistRemoteUrlError < GitHttpsablePushError; end
  end
end
