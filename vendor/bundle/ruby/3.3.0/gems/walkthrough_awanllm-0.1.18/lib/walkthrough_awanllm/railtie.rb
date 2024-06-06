# lib/awanllm/railtie.rb

require 'rails/railtie'
require 'fileutils'

module AwanLLM
  class Railtie < Rails::Railtie
    initializer "awanllm.track_activity" do |app|
      app.config.middleware.use AwanLLM::Tracker
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
      log_activity(env)
      [status, headers, response]
    end

    private

    def log_activity(env)
      log_file_path = Rails.root.join('log', 'awanllm_activity.log')
      FileUtils.mkdir_p(File.dirname(log_file_path))
      File.open(log_file_path, "a") do |file|
        file.puts("### [#{Time.now}] Activity Log")
        file.puts("\n")
        file.puts("#### HTTP Request:")
        file.puts("- Method: #{env['REQUEST_METHOD']}")
        file.puts("- Path: #{env['PATH_INFO']}")
        file.puts("\n")
        file_changes = `git diff --name-status HEAD^ HEAD | grep -v '/vendor/'`
        if file_changes.present?
          file.puts("#### File Changes:")
          file.puts(file_changes)
          file.puts("\n")
        end
        # Add more logging for other activities as needed
      end
    end
  end
end
