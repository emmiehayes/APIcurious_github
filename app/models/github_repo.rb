class GithubRepo

  attr_reader :name, :description, :url, :star_count, :created_at, :updated_at

  def initialize(data)
    @name         = data[:name]
    @description  = data[:description]
    @url          = data[:git_url]
    @star_count   = data[:stargazers_count]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end
end