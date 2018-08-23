class GithubEvent

  attr_reader :type, :repo_name, :commits, :date

  def initialize(data)
    @type      = data[:type]
    @repo_name = data[:repo][:name]
    @commits   = wrap(data[:payload][:commits])
    @date      = data[:created_at]
  end

  def wrap(commits)
    return 0 if commits.nil?
    commits.map do |commit|
      GithubCommit.new(commit)
    end
  end
end