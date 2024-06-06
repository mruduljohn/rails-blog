# lib/awanllm/railtie.rb

require 'rails/railtie'
require 'fileutils'

module AwanLLM
  class Railtie < Rails::Railtie
    initializer "awanllm.track_activity" do |app|
      app.config.middleware.use AwanLLM::Tracker

      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.before_commit do
          AwanLLM::Tracker.new(nil).update_activity_log
        end
      end
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
