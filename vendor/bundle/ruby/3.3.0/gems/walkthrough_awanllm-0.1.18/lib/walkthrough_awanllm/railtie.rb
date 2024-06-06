require 'rails/railtie'
require 'fileutils'
require 'bundler'
require 'git'
require 'listen'

module WalkthroughAwanllm
  class Railtie < Rails::Railtie
    initializer "awanllm.track_activity" do |app|
      app.config.middleware.use AwanLLM::Tracker
      Bundler::Plugin.add_hook('after-install-all') do |specs|
        log_gem_event('install', specs)
      end
      Bundler::Plugin.add_hook('before-uninstall-all') do |specs|
        log_gem_event('uninstall', specs)
      end
      Bundler::Plugin.add_hook('before-update-all') do |specs|
        log_gem_event('update', specs)
      end
      Bundler::Plugin.add_hook('after-exec-all') do |specs|
        log_gem_event('execute', specs)
      end
      Bundler::Plugin.add_hook('after-update-all') do |specs|
        log_gem_event('update', specs)
      end
      Bundler::Plugin.add_hook('after-clean-all') do |specs|
        log_gem_event('clean', specs)
      end
      Bundler::Plugin.add_hook('after-list-all') do |specs|
        log_gem_event('list', specs)
      end

      # Start Git repository monitoring
      git = Git.open('.')
      listener = Listen.to('.', only: /\.rb$/, ignore: /vendor|log/) do |modified, added, removed|
        log_file_changes(modified, added, removed, git)
      end
      listener.start
    end

    private

    def log_gem_event(action, specs)
      FileUtils.mkdir_p("log")
      File.open("log/awanllm_activity.log", "a") do |file|
        file.puts("[#{Time.now}] Gem #{action}: #{specs.map(&:name).join(', ')}")
      end
    end

    def log_file_changes(modified, added, removed, git)
      FileUtils.mkdir_p("log")
      File.open("log/awanllm_activity.log", "a") do |file|
        modified.each { |file| file.puts("[#{Time.now}] Modified: #{file} (#{git.diff.stats[:changed]} lines changed)") }
        added.each { |file| file.puts("[#{Time.now}] Added: #{file}") }
        removed.each { |file| file.puts("[#{Time.now}] Removed: #{file}") }
      end
    end
  end
end
