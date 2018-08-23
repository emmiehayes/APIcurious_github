class GithubEvent

  attr_reader :type, :repo_name, :commits, :date

  def initialize(data)
    @type      = data[:type]
    @repo_name = data[:repo][:name]
    @commits   = data[:payload][:commits]
    @date      = data[:created_at]
  end
end