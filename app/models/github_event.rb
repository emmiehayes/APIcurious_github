class GithubEvent

  attr_reader :type, :repo_name, :commits, :date

  def initialize(data)
    @type      = remove_text(data[:type])
    @repo_name = data[:repo][:name]
    @commits   = wrap(data[:payload][:commits])
    @date      = format(data[:created_at])
  end

  def wrap(commits)
    return 0 if commits.nil?
    commits.map do |commit|
      GithubCommit.new(commit)
    end
  end

  def remove_text(type)
    type.gsub("Event", "")
  end

  def format(date)
    (DateTime.parse(date)).strftime("%A, %B %d, %Y")
  end
end