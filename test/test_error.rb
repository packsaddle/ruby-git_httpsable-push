require_relative 'helper'

module GitHttpsable
  module Push
    class TestError < Test::Unit::TestCase
      sub_test_case 'masked userinfo' do
        userinfo = '__SECRET__'
        url_with_userinfo = "https://#{userinfo}@example.com"
        hash_with_url = { key: url_with_userinfo, "#{url_with_userinfo}" => 'value' }
        masked_userinfo = 'MASKED'
        test 'remove userinfo' do
          error = GitHttpsablePushError.new(url_with_userinfo)
          assert do
            !error.message.include?(userinfo)
          end
        end
        test 'use mask' do
          error = GitHttpsablePushError.new(url_with_userinfo)
          assert do
            error.message.include?(masked_userinfo)
          end
        end
        test 'remove userinfo hash' do
          error = GitHttpsablePushError.new(hash_with_url)
          assert do
            !error.message.include?(userinfo)
          end
        end
      end
    end
  end
end
