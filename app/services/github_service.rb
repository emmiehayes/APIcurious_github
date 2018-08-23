class GithubService 

  def initialize(oauth_token)
    @oauth_token = oauth_token
  end
  
  def raw_user
    get_json("/user")
  end

  private

  def conn
    Faraday.new(:url => "https://api.github.com/") do |faraday|
      faraday.headers["Authorization"] = "token #{@oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end