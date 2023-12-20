# Applin::Rails

This is the source code for <https://rubygems.org/gems/applin-rails>.

Use this library to make a backend for your mobile app which uses
the Applin™ Server-Driven UI framework.
See <https://www.applin.dev/>

## Install
To add the gem to your Rails application:

    $ bundle add applin-rails

## Use
* Docs: <https://www.applin.dev/docs/backend-libraries.html>
* Example: <https://github.com/leonhard-llc/applin-rails-demo>

## Changes
- v0.6.0
    - Support ApplinIos v0.25.0.
    - Add `poll_delay_ms` to checkbox and textfield.
    - Remove checkbox `rpc` field.

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
