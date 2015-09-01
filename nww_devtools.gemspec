# encoding: utf-8

require File.expand_path('../lib/nww_devtools/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ['Florian Dütsch', 'Florian Unglaub']
  gem.email = ['florian.duetsch@nix-wie-weg.de',
               'florian.unglaub@nix-wie-weg.de']
  gem.description = 'Gems used in development at Nix-wie-weg'
  gem.summary = 'Gems used in development at Nix-wie-weg'
  gem.homepage = 'https://github.com/Nix-wie-weg/nww_devtools'

  gem.files = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.name = 'nww_devtools'
  gem.require_paths = ['lib']
  gem.version = NwwDevtools::VERSION

  gem.add_dependency 'pry'
  gem.add_dependency 'pry-doc'
  gem.add_dependency 'pry-byebug'
  gem.add_dependency 'pry-remote'
  gem.add_dependency 'pry-theme'
  gem.add_dependency 'awesome_print'
  gem.add_dependency 'rubocop-nww', '>= 0.0.5'
end
