# frozen_string_literal: true

require_relative 'lib/anilibria/api/version'

Gem::Specification.new do |spec|
  spec.name = 'anilibria-api-ruby'
  spec.version = Anilibria::Api::VERSION
  spec.authors = ['Roman Kozachenko']
  spec.email = ['psychosocial88@tutanota.com']

  spec.summary = 'Client for AniLibria API'
  spec.homepage = 'https://github.com/psychosocial88/anilibria-api-ruby'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-struct', '~> 1.4'
  spec.add_dependency 'faraday', '~> 2'
end
