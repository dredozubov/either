# Do not instantiate this class EVER
class Either
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def self.[](value)
    new(value)
  end

  def success?
    !failure?
  end

  def failure?
    !success?
  end

  # This is haskell's >>= operator (pronounced "bind")
  # Basically, it's:
  # (>>=) :: forall a b. m a -> (a -> m b) -> m b
  # see https://hackage.haskell.org/package/base-4.2.0.1/docs/Prelude.html#9
  # for more details
  def bind(f)
    success? ? f.call(value) : self
  end

  # Applies function f to unwrapped value of self.
  # It's type is:
  # either :: (a -> c) -> (b -> c) -> Either a b -> c
  # for further details see
  # https://hackage.haskell.org/package/base-4.2.0.1/docs/src/Data-Either.html#either
  #
  # Hopefully keyword arguments will improve readability
  def either(failure:, success:)
    failure? ? failure.call(value) : success.call(value)
  end
end

class Failure < Either
  define_method :failure?, -> { true }
end

class Success < Either
  define_method :success?, -> { true }
end
