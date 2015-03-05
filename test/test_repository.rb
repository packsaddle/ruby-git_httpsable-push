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
      sub_test_case '#git_clone_url_parse' do
        def setup
          @repo = Repository.new('.')
        end
        git_url = 'git://github.com/schacon/ticgit.git'
        ssh_url = 'git@github.com:schacon/ticgit.git'
        https_url = 'https://github.com/schacon/ticgit.git'
        test 'git protocol host' do
          assert do
            @repo.git_clone_url_parse(git_url).host == 'github.com'
          end
        end
        test 'git protocol scheme' do
          assert do
            @repo.git_clone_url_parse(git_url).scheme == 'git'
          end
        end
        test 'git protocol path' do
          assert do
            @repo.git_clone_url_parse(git_url).path == '/schacon/ticgit.git'
          end
        end
        test 'ssh protocol host' do
          assert do
            @repo.git_clone_url_parse(ssh_url).host == 'github.com'
          end
        end
        test 'ssh protocol scheme' do
          assert do
            @repo.git_clone_url_parse(ssh_url).scheme.nil?
          end
        end
        test 'ssh protocol path' do
          assert do
            @repo.git_clone_url_parse(ssh_url).path == '/schacon/ticgit.git'
          end
        end
        test 'https protocol host' do
          assert do
            @repo.git_clone_url_parse(https_url).host == 'github.com'
          end
        end
        test 'https protocol scheme' do
          assert do
            @repo.git_clone_url_parse(https_url).scheme == 'https'
          end
        end
        test 'https protocol path' do
          assert do
            @repo.git_clone_url_parse(https_url).path == '/schacon/ticgit.git'
          end
        end
      end
    end
  end
end
