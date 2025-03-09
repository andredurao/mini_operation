https://guides.rubygems.org/make-your-own-gem/#your-first-gem

https://bundler.io/guides/creating_gem.html

# MiniOperation

This is a ruby gem inspired on Trailblazer's Operation, but with less features and using composition.

With this gem you can create your operations like this:

```ruby
class MyOperation
  include MiniOperation

  step :load
  step :calculate
  step :save

  private

  def load
    # do something
  end

  def calculate
    # do something else
  end

  def save
    # and finally this
  end
end
```

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mini_operation`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add mini_operation

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mini_operation

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Testing:

1. Build the gem using: `gem build mini_operation.gemspec`
2. Install the gem: `gem install './mini_operation-[VERSION].gem'`
3. A minimal operation example:
```ruby
require 'mini_operation'

class MyOp
  include MiniOperation

  step :load

  def load
    puts 'load'
  end
end

my_op = MyOp.new
my_op.perform
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andredurao/mini_operation. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/andredurao/mini_operation/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MiniOperation project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/andredurao/mini_operation/blob/master/CODE_OF_CONDUCT.md).
