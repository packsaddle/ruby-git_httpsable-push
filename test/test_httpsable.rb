require_relative 'helper'

module GitPush
  class TestHttpsable < Test::Unit::TestCase
    test 'version' do
      assert do
        !::GitHttpsable::Push::VERSION.nil?
      end
    end
  end
end
