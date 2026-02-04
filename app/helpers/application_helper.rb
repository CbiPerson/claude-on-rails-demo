module ApplicationHelper
  def app_version
    @app_version ||= File.read(Rails.root.join("VERSION")).strip rescue "0.0.0"
  end

  def app_sha
    @app_sha ||= (ENV["KAMAL_VERSION"] || `git rev-parse --short HEAD 2>/dev/null`.strip).then { |s| s[0, 7] }
  end
end
