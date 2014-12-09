$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require "either/version"

Gem::Specification.new do |s|
  s.name              = "either-monad"
  s.licenses          = ['MIT']
  s.version           = Either::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Dead simple error context framework aka Either monad."
  s.homepage          = "http://github.com/dredozubov/either-monad"
  s.email             = "denis.redozubov@gmail.com"
  s.authors           = [ "Denis Redozubov" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("test/**/*")

  s.required_ruby_version = '~> 2.0'
  s.add_runtime_dependency 'rake', '~> 10.2', '>= 10.2.0'
  s.add_development_dependency 'pry', '~> 0.9', '~> 0.9.12.6'

  s.description       = <<desc
  Simple Either monad implementation. Great way to chain actions that may result in error and keep their context, both successful and erroneous.
desc
end
