module Github
  class Repo

    attr_reader :name, :description, :url, :star_count, :created_at, :updated_at

    def initialize(data)
      @name         = data[:name]
      @description  = data[:description]
      @url          = data[:html_url]
      @star_count   = data[:stargazers_count]
      @created_at   = format(data[:created_at])
      @updated_at   = format(data[:updated_at])
    end

    def format(date)
      date.to_date
    end
  end
end