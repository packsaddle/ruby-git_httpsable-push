require_relative 'helper'

module GitHttpsable
  module Push
    class TestRepository < Test::Unit::TestCase
      sub_test_case '#remote_url' do
        def setup
          @repo = Repository.new('.')
        end

        test 'no remote' do
          git = stub(remote: nil)
          @repo.stubs(:git).returns(git)
          assert 'then return nil' do
            @repo.remote_url('origin') == nil
          end
        end
      end
    end
  end
end
