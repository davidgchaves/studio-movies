Gem::Specification.new do |s|
  s.name = "flicks"
  s.version = "1.0.0"
  s.author = "The Pragmatic Studio"
  s.email = "support@pragmaticstudio.com"
  s.summary = "Plays and reviews movies"
  s.description = "Tons of awesomeness!!!"
  s.license = 'MIT'
  s.homepage = "http://pragmaticstudio.com"

  s.files = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE)
  s.test_files = Dir["spec/**/*"]
  s.executables = [ 'flicks' ]

  s.required_ruby_version = '>=2.1'
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
end
