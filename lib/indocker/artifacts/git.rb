class Indocker::Artifacts::Git
  attr_reader :name, :remote_name, :remote_url, :branch, :source_path, :target_path

  def initialize(name:, remote_name:, remote_url:, branch:, source_path:, target_path:)
    @name        = name
    @remote_name = remote_name
    @remote_url  = remote_url
    @branch      = branch
    @source_path = source_path
    @target_path = target_path
  end

  def repository
    @repository ||= Indocker::Repositories::Git.new(@name).setup(
      remote_name: remote_name,
      remote_url:  remote_url,
      branch:      branch,
      clone_path:  "/tmp/#{Indocker.configuration.name}/artifacts/git/#{project_name(remote_url)}/#{branch}"
    )
  end

  def project_name(url)
    url.split('/').last.gsub('.git', '')
  end
end