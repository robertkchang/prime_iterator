Gem::Specification.new do |s|
  s.name        = 'prime_iterator'
  s.version     = '1.1'
  s.date        = '2012-06-21'
  s.summary     = "Provide API to get next and previous prime number"
  s.description = "Provide API to get next and previous prime number.  Uses the prime_finder gem."
  s.authors     = ["Robert Chang"]
  s.email       = 'rchang@fulcrum.net'
  s.files       = ["lib/prime_iterator.rb"]
  s.homepage    =
      'http://rubygems.org/gems/prime_iterator'
  s.add_runtime_dependency "prime_finder", "~>1.0.2"
end