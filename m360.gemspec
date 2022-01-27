require_relative 'lib/m360/version'

Gem::Specification.new do |spec|
  spec.name          = 'm360'
  spec.version       = M360::VERSION
  spec.authors       = ['Nujian Den Mark Meralpis']
  spec.email         = ['denmarkmeralpis@gmail.com']
  spec.summary       = 'Ruby wrapper for M360 API'
  spec.description   = 'Consumes M360 API'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'httparty', '~> 0.20'
  spec.add_development_dependency 'webmock', '~> 3.4'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
