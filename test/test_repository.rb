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
          assert do
            @repo.remote_url('origin').nil?
          end
        end
        test 'remote, but no url' do
          git = stub(remote: stub(url: nil))
          @repo.stubs(:git).returns(git)
          assert do
            @repo.remote_url('origin').nil?
          end
        end
        test 'remote and url' do
          git = stub(remote: stub(url: 'remote-url'))
          @repo.stubs(:git).returns(git)
          assert 'then return url' do
            @repo.remote_url('origin') == 'remote-url'
          end
        end
      end
    end
  end
end
