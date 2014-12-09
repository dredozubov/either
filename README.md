Either
======

Dead simple error context framework aka Either monad. Goal of this gem is to
provide solid ground to control flow without exceptions and allow simple and
expressive chaining and handling failures gracefully.
Don't fear the name though, you don't have to know what monad is to understand
how his gem work and use it with ease!

Installation
------------

in terminal

``` terminal
$ gem install either-monad
```

or in **Gemfile**

``` ruby
gem 'either-monad'
```


Examples
--------

All examples taken from production code.

### Chaining computations

You can chain computations without fear of losing a failure context. For
example you can validate a request, make some work and serialize the result
with:

```
# results in either Success with serialized result or Failure with context.
validate(request)
  .bind(->(validated) { search(validated) })
  .bind(->(search_result) { serialize(search_result) })

```

If `Failure` has been returned from one of the binded methods, the whole
expression will be evaluated to this this `Failure` value.
Each of the binded method(to make sense type-wise) must take unwrapped value
from previous one, do some work and return new value wrapped in `Success`
or `Failure`.

### Wrapping values into Success or Failure context

```
Success[value]
```

or

```
Failure[failure_context]
```

### Unwrapping values

It's just an attribute reader!

```
result = Success[:foo]
result.value # => :foo
```

Ruby version support
--------------------

Gem is supposed to work correctly with the following rubies:

* 2.0.0
* 2.1.4
* jruby

Contributing
-------------

* fork it
* make some changes and submit a pull request
* do not make changes to version
