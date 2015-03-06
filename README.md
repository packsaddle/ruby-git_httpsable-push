# GitHttpsable::Push

[![Gem Version](http://img.shields.io/gem/v/git_httpsable-push.svg?style=flat)](http://badge.fury.io/rb/git_httpsable-push)
[![Build Status](http://img.shields.io/travis/packsaddle/ruby-git_httpsable-push/master.svg?style=flat)](https://travis-ci.org/packsaddle/ruby-git_httpsable-push)

## Description

* Easy to set up `git push` via `https://...`.
* Keep your `git push` via https **Safely**.

## Usage

require `GITHUB_ACEESS_TOKEN`.

```bash
# like git push
$ git httpsable-push origin master
```

Whether you set `git://...` or `https://...` or `git@...`, you can push via `https://...`.

And this always masks your token.

e.g.

```
$ git config --get remote.origin.url
git@github.com:packsaddle/ruby-git_httpsable-push.git
# GITHUB_ACCESS_TOKEN=__MY_TOKEN__

# success
$ git httpsable-push origin refactor/logger-to-class --verbose
I, [2015-03-06T19:29:54.250481 #33391]  INFO -- GitHttpsable::Push: Starting Git
I, [2015-03-06T19:29:54.270408 #33391]  INFO -- GitHttpsable::Push: git '--git-dir=/Users/sane/work/ruby-study/git_httpsable-push/.git' '--work-tree=/Users/sane/work/ruby-study/git_httpsable-push' config '--list'  2>&1
I, [2015-03-06T19:29:54.281424 #33391]  INFO -- GitHttpsable::Push: git '--git-dir=/Users/sane/work/ruby-study/git_httpsable-push/.git' '--work-tree=/Users/sane/work/ruby-study/git_httpsable-push' config '--list'  2>&1
I, [2015-03-06T19:29:56.632766 #33391]  INFO -- GitHttpsable::Push: git '--git-dir=/Users/sane/work/ruby-study/git_httpsable-push/.git' '--work-tree=/Users/sane/work/ruby-study/git_httpsable-push' push 'https://MASKED@github.com/packsaddle/ruby-git_httpsable-push.git' 'refactor/logger-to-class'  2>&1
I, [2015-03-06T19:29:56.632944 #33391]  INFO -- GitHttpsable::Push: {:output=>nil}

# error occurs
$ git httpsable-push origin refactor/logger-to-class --verbose
I, [2015-03-06T19:33:47.692967 #34984]  INFO -- GitHttpsable::Push: Starting Git
I, [2015-03-06T19:33:47.701617 #34984]  INFO -- GitHttpsable::Push: git '--git-dir=/Users/sane/work/ruby-study/git_httpsable-push/.git' '--work-tree=/Users/sane/work/ruby-study/git_httpsable-push' config '--list'  2>&1
I, [2015-03-06T19:33:47.711167 #34984]  INFO -- GitHttpsable::Push: git '--git-dir=/Users/sane/work/ruby-study/git_httpsable-push/.git' '--work-tree=/Users/sane/work/ruby-study/git_httpsable-push' config '--list'  2>&1
I, [2015-03-06T19:33:50.657268 #34984]  INFO -- GitHttpsable::Push: git '--git-dir=/Users/sane/work/ruby-study/git_httpsable-push/.git' '--work-tree=/Users/sane/work/ruby-study/git_httpsable-push' push 'https://MASKED@github.com/packsaddle/ruby-git_httpsable-push.git' 'refactor/logger-to-class'  2>&1
E, [2015-03-06T19:33:50.657632 #34984] ERROR -- GitHttpsable::Push: Have a question? Please ask us:
E, [2015-03-06T19:33:50.657667 #34984] ERROR -- GitHttpsable::Push: https://github.com/packsaddle/ruby-git_httpsable-push/issues/new
E, [2015-03-06T19:33:50.657711 #34984] ERROR -- GitHttpsable::Push: options:
E, [2015-03-06T19:33:50.657778 #34984] ERROR -- GitHttpsable::Push: {"debug"=>false, "verbose"=>true, "force"=>false, "tags"=>false}
/Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/git-1.2.9.1/lib/git/lib.rb:917:in `command': (Git::GitExecuteError) git '--git-dir=/Users/sane/work/ruby-study/git_httpsable-push/.git' '--work-tree=/Users/sane/work/ruby-study/git_httpsable-push' push 'https://MASKED@github.com/packsaddle/ruby-git_httpsable-push.git' 'refactor/logger-to-class'  2>&1:remote: Invalid username or password. (GitHttpsable::Push::GitHttpsablePushError)
fatal: Authentication failed for 'https://MASKED@github.com/packsaddle/ruby-git_httpsable-push.git/'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/git-1.2.9.1/lib/git/lib.rb:727:in `push'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/git-1.2.9.1/lib/git/base.rb:329:in `push'
        from /Users/sane/work/ruby-study/git_httpsable-push/lib/git_httpsable/push/repository.rb:24:in `push'
        from /Users/sane/work/ruby-study/git_httpsable-push/lib/git_httpsable/push/cli.rb:29:in `push'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor/command.rb:27:in `run'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor/invocation.rb:126:in `invoke_command'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor.rb:359:in `dispatch'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor/base.rb:440:in `start'
        from /Users/sane/work/ruby-study/git_httpsable-push/lib/git_httpsable/push/cli.rb:59:in `method_missing'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor/command.rb:29:in `run'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor/command.rb:126:in `run'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor/invocation.rb:126:in `invoke_command'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor.rb:359:in `dispatch'
        from /Users/sane/work/ruby-study/git_httpsable-push/vendor/bundle/ruby/2.2.0/gems/thor-0.19.1/lib/thor/base.rb:440:in `start'
        from exe/git-httpsable-push:5:in `<main>'
```

## VS.

* `git push --quiet`, set remote url manually, error to `/dev/null`

```
$ git push --quiet https://$GH_TOKEN@github.com/<repos_name>.git gh-pages 2> /dev/null
```

This can push safely,
but if you forgot `--quiet` or `2> /dev/null`,
then you open your token to the world :(

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'git_httpsable-push'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_httpsable-push

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec git_httpsable-push` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/packsaddle/ruby-git_httpsable-push/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
