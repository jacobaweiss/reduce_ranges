# ReduceRanges

Reduce consecutive integers or dates in an array into ranges.

## Installation

Add this line to your application's Gemfile:

    gem 'reduce_ranges'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reduce_ranges

## Usage

ReduceRanges adds an extension to the Array object. To use it, call `#reduce_ranges` on an array of integers or dates:
```ruby
[-3, -2, -1, 1, 3, 4, 5].reduce_ranges #=> [-3..-1, 1, 3..5]
```

```ruby
[Date.new(2018,5,30), Date.new(2018,5,31), Date.new(2018,6,1), Date.new(2018,6,3), Date.new(2018,6,5),Date.new(2018,6,6)].reduce_ranges #=> [Wed, 30 May 2018..Fri, 01 Jun 2018, Sun, 03 Jun 2018, Tue, 05 Jun 2018..Wed, 06 Jun 2018]
```

Note that this only works on arrays of integers or dates. If you call it on an array with any other kind of element, it will raise an error:
```ruby
%w(what it do).reduce_ranges #=> TypeError
[1.0, 2.0, 3.0].reduce_ranges #=> TypeError
# etc..
```

Shout outs to [@calyhre](https://github.com/Calyhre) for the current implementation and [@lkdjiin](https://github.com/lkdjiin) for his blog posts on the subject!i

## Contributing

1. Fork it ( https://github.com/jacobaweiss/reduce_ranges/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
