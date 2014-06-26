# ReduceRanges

Reduce consecutive integers in an array into ranges.

## Installation

Add this line to your application's Gemfile:

    gem 'reduce_ranges'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reduce_ranges

## Usage

ReduceRanges adds an extension to the Array object. To use it, call `#reduce_ranges` on an array of integers:
```ruby
[-3, -2, -1, 1, 3, 4, 5].reduce_ranges #=> [-3..-1, 1, 3..5]
```

Note that this only works on arrays of integers. If you call it on an array with any other kind of element, it will raise an error:
```ruby
%w(what it do).reduce_ranges #=> TypeError
[1.0, 2.0, 3.0].reduce_ranges #=> TypeError
# etc..
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/reduce_ranges/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
