require_relative 'helper'

module GitHttpsable
  module Push
    class TestMaskLogger < Test::Unit::TestCase
      def setup
        @strio = StringIO.new
        @logger = MaskLogger.new(@strio)
      end

      sub_test_case 'masked userinfo' do
        userinfo = '__SECRET__'
        url_with_userinfo = "https://#{userinfo}@example.com"
        hash_with_url = { key: url_with_userinfo, "#{url_with_userinfo}" => 'value' }
        masked_userinfo = 'MASKED'
        test 'remove userinfo' do
          @logger.error(url_with_userinfo)
          assert do
            !@strio.string.include?(userinfo)
          end
        end
        test 'use mask' do
          @logger.error(url_with_userinfo)
          assert do
            @strio.string.include?(masked_userinfo)
          end
        end
        test 'remove userinfo hash' do
          @logger.error(hash_with_url)
          assert do
            !@strio.string.include?(userinfo)
          end
        end
      end
    end
  end
end
