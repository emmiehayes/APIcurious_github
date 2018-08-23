class GithubRepo

  attr_reader :name, :description, :url, :star_count, :created_at, :updated_at

  
  def initialize(data)
    @name         = data[:name]
    @description  = data[:owner][:description]
    @url          = data[:owner][:html_url]
    @star_count   = data[:owner][:stargazers_count]
    @created_at   = data[:owner][:created_at]
    @updated_at   = data[:owner][:updated_at]
  end
end