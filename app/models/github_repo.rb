class GithubRepo

  attr_reader :name, :description, :url, :star_count, :created_at, :updated_at

  def initialize(data)
    @name         = data[:name]
    @description  = data[:description]
    @url          = data[:html_url]
    @star_count   = data[:stargazers_count]
    @created_at   = format_date(data[:created_at])
    @updated_at   = format_date(data[:updated_at])
  end

  def format_date(date)
    date.to_date
  end

end