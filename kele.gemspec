Gem::Specification.new do |s|
  s.name          = 'kele'
  s.version       = '0.0.1'
  s.date          = '2018-01-16'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Jonathan Lee']
  s.email         = 'jonathan.h.lee@gmail.com'
  s.files         = ['lib/kele.rb', 'lib/roadmap.rb', 'lib/messages.rb']
  s.require_paths = ["lib"]
  s.homepage      =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.15'
  s.add_runtime_dependency 'json', '~2.1'
end
