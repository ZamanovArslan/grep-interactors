[![Gem Version](https://badge.fury.io/rb/grep-interactors.svg)](https://badge.fury.io/rb/grep-interactors)

# Grep::Interactors

Gem, which helps grep through organized Interactors.
For example, if sent interactor as ARG contains calling of other interactors, it will try to find entries in them.
More in spec/

![Grep-Interactors](https://user-images.githubusercontent.com/32578180/94605038-34937000-02a1-11eb-8f17-ad33efa9c289.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grep-interactors'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install grep-interactors

## Usage

## How to run
```bash
$ grep-interactors interactors_path file_path keyword
```
eg
```bash
$ grep-interactors /home/stanislav_lemm/Projects/solaris/app/interactors/ /home/stanislav_lemm/Projects/solaris/app/interactors/agreements/create.rb user

/home/stanislav_lemm/Projects/solaris/app/interactors/user/update_attributes.rb:6
/home/stanislav_lemm/Projects/solaris/app/interactors/user/update_attributes.rb:9
/home/stanislav_lemm/Projects/solaris/app/interactors/user/update_attributes.rb:12
/home/stanislav_lemm/Projects/solaris/app/interactors/user/update_attributes.rb:18
/home/stanislav_lemm/Projects/solaris/app/interactors/user/update_attributes.rb:30
/home/stanislav_lemm/Projects/solaris/app/interactors/user/update_attributes.rb:34
/home/stanislav_lemm/Projects/solaris/app/interactors/user/mind/refresh_value.rb:8
/home/stanislav_lemm/Projects/solaris/app/interactors/user/mind/refresh_value.rb:9
/home/stanislav_lemm/Projects/solaris/app/interactors/user/mind/refresh_value.rb:13
/home/stanislav_lemm/Projects/solaris/app/interactors/user/mind/refresh_value.rb:35
/home/stanislav_lemm/Projects/solaris/app/interactors/user/mind/refresh_value.rb:39
```
_Works only with absolute path for now_

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Roadmap
* Add docs
* intellij idea plugin
* Sublime Text 3 package

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ZamanovArslan/grep-interactors.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
