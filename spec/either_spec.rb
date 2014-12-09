require 'minitest/autorun'
require 'either'

# helpers
def successful
  Success['some data']
end

def to_42(data)
  Success[42]
end

def erroneous
  Failure['scary exception']
end

def to_fail(x)
  Failure[RuntimeError.new(x)]
end

describe Either do
  describe '.bind' do
    describe 'successful' do
      specify 'both sides are success' do
        result = successful.bind(method(:to_42))
        result.must_be_instance_of Success
        result.value.must_equal 42
      end
    end

    describe 'erroneous' do
      specify 'left side is success, right is failure' do
        result = successful.bind(method(:to_fail))
        result.must_be_instance_of Failure
        result.value.must_equal RuntimeError.new('some data')
      end

      specify 'left side is failure, right is success' do
        result = erroneous.bind(method(:to_42))
        result.must_be_instance_of Failure
        result.value.must_equal 'scary exception'
      end

      specify 'both sides are failures, first failure must be returned' do
        result = erroneous.bind(method(:to_fail))
        result.must_be_instance_of Failure
        result.value.must_equal 'scary exception'
      end
    end
  end

  describe '.either' do
    it 'evaluates success callback if Success is provided' do
      successful.either(
        success: -> _ { :success },
        failure: -> _ { :failure }
      ).must_equal :success
    end

    it 'evaluates failure callback if Failure is provided' do
      erroneous.either(
        success: -> _ { :success },
        failure: -> _ { :failure }
      ).must_equal :failure
    end
  end
end
