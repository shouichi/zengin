lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'zengin/version'

Gem::Specification.new do |s|
  s.name          = 'zengin'
  s.version       = Zengin::VERSION
  s.summary       = 'Exports deposits as a zengin formatted csv.'
  s.description   = s.summary
  s.authors       = ['Shouichi Kamiya']
  s.email         = ['shouichi.kamiya@gmail.com']
  s.homepage      = 'https://shouichi.github.com/zengin/'
  s.license       = 'MIT'
  s.files         = ['lib/zengin.rb']
  s.files         = %w(LICENSE README.md zengin.gemspec)
  s.files         += Dir.glob('lib/**/*.rb')
  s.files         += Dir.glob('spec/**/*')
  s.require_paths = ['lib']
end
