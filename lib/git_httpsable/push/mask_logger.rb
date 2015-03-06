module GitHttpsable
  module Push
    class MaskLogger < Logger
      def initialize(*args)
        super(*args)
        self.progname = 'GitHttpsable::Push'
        self.level = Logger::WARN
        self.formatter = proc do |severity, datetime, progname, msg|
          @default_formatter.call(
            severity,
            datetime,
            progname,
            msg.to_s.gsub(%r{://[^/@]*@}) { '://MASKED@' }
          )
        end

        self
      end
    end
  end
end
