# -*- encoding: utf-8 -*-
# stub: walkthrough_awanllm 0.1.19 ruby lib

Gem::Specification.new do |s|
  s.name = "walkthrough_awanllm".freeze
  s.version = "0.1.19".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/mruduljohn/Walkthrough_awanllm_gem" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mrudul John".freeze]
  s.date = "2024-06-06"
  s.description = "{UNDER DEVELOPMENT NOT FOR USE YET}A Ruby gem to generate a walkthrough the project lifecycle with the AwanLLM API for generating and retrieving content.".freeze
  s.email = ["mrudulmathews@gmail.com".freeze]
  s.executables = ["setup_awanllm.rb".freeze]
  s.files = ["bin/setup_awanllm.rb".freeze]
  s.homepage = "https://github.com/mruduljohn/Walkthrough_awanllm_gem".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "    Thank you for installing the Walkthrough_AwanLLM gem!\n    To complete the setup, please run the following command:\n    ruby ./vendor/bundle/ruby/3.3.0/gems/walkthrough_awanllm-0.1.19/bin/setup_awanllm.rb\n".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.5.3".freeze
  s.summary = "A Ruby gem to Generate Project Development Walkthrough with the AwanLLM API.".freeze

  s.installed_by_version = "3.5.3".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<httparty>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<thor>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0".freeze])
end
