# lib/awanllm/railtie.rb

require 'rails/railtie'
require 'fileutils'

module AwanLLM
  class Railtie < Rails::Railtie
    initializer "awanllm.track_activity" do |app|
      app.config.middleware.use AwanLLM::Tracker

      # Automatically set up the Git hook for tracking activity log updates
      setup_git_hook
    end

    private

    def setup_git_hook
      git_hook_script_path = Rails.root.join('.git', 'hooks', 'post-commit')
      git_hook_script_content = <<-SCRIPT
#!/bin/bash
RAILS_ROOT="#{Rails.root}"
cd $RAILS_ROOT
bundle exec rails update_activity_log
      SCRIPT

      # Write the Git hook script
      File.open(git_hook_script_path, "w") { |f| f.write(git_hook_script_content) }
      FileUtils.chmod(0755, git_hook_script_path)

      # Inform the user about the setup
      puts "Git hook for tracking activity log updates has been set up: #{git_hook_script_path}"
    end
  end
end

# Middleware to track activities
module AwanLLM
  class Tracker
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      update_activity_log
      [status, headers, response]
    end

    def update_activity_log
      log_file_path = Rails.root.join('log', 'awanllm_activity.log')
      FileUtils.mkdir_p(File.dirname(log_file_path))
      File.open(log_file_path, "a") do |file|
        file.puts("### [#{Time.now}] Activity Log")
        file.puts("\n")
        file.puts("#### Gem Changes:")
        gem_changes = `git diff-tree --no-commit-id --name-status -r HEAD^..HEAD Gemfile.lock | grep -v '/vendor/'`
        if gem_changes.present?
          gem_changes.each_line do |line|
            file.puts("- #{line.strip}")
          end
          file.puts("\n")
        end
        file.puts("#### File Changes:")
        file_changes = `git diff --name-status HEAD^ HEAD | grep -v '/vendor/'`
        if file_changes.present?
          file_changes.each_line do |line|
            file.puts("- #{line.strip}")
          end
          file.puts("\n")
        end
      end
    end
  end
end
