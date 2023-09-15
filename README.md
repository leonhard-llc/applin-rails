# Applin::Rails

This is the source code for the [applin-rails](https://rubygems.org/gems/applin-rails) gem.
It is a library for making Ruby on Rails servers that work with [Applin™](https://www.applin.dev/).

## Install
To add the gem to your Rails application:

    $ bundle add applin-rails

## Use
See https://github.com/leonhard-llc/applin-rails-demo

## Contributing
Bug reports and pull requests are welcome on GitHub at <https://github.com/leonhard-llc/applin-rails>.

When sending PRs, please email us a signed CLA using [cla-email-template.txt](cla-email-template.txt).

## Development
* Install dependencies: `bin/setup`
* `rake test`
* `bin/console`

To release a new version:
1. Install the gem onto your local machine: `bundle exec rake install`
2. Test it with <https://github.com/leonhard-llc/applin-rails-demo>
1. Update the version number in `version.rb`
1. Run `bundle exec rake release`.  This will create a git tag, make a `.gem` file, and push the file to <https://rubygems.org>.
