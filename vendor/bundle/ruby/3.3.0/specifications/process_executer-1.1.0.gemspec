# -*- encoding: utf-8 -*-
# stub: process_executer 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "process_executer".freeze
  s.version = "1.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://rubydoc.info/gems/process_executer/1.1.0/file/CHANGELOG.md", "documentation_uri" => "https://rubydoc.info/gems/process_executer/1.1.0", "homepage_uri" => "https://github.com/main-branch/process_executer", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/main-branch/process_executer" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["James Couball".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-02-03"
  s.description = "An API for executing commands in a subprocess".freeze
  s.email = ["jcouball@yahoo.com".freeze]
  s.homepage = "https://github.com/main-branch/process_executer".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.3".freeze
  s.summary = "An API for executing commands in a subprocess".freeze

  s.installed_by_version = "3.5.3".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler-audit>.freeze, ["~> 0.9".freeze])
  s.add_development_dependency(%q<create_github_release>.freeze, ["~> 1.1".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.1".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.59".freeze])
  s.add_development_dependency(%q<semverify>.freeze, ["~> 0.3".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.22".freeze])
  s.add_development_dependency(%q<simplecov-lcov>.freeze, ["~> 0.8".freeze])
  s.add_development_dependency(%q<redcarpet>.freeze, ["~> 3.6".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9".freeze, ">= 0.9.28".freeze])
  s.add_development_dependency(%q<yardstick>.freeze, ["~> 0.9".freeze])
end
