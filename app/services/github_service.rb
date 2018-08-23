class GithubService 

  def initialize(oauth_token, username)
    @oauth_token = oauth_token
    @username = username
  end
  
  def raw_profile_data
    get_json('/user')
  end

  def raw_repo_list
    get_json("/users/#{@username}/repos")
  end

  def raw_event_list 
    get_json("/users/#{@username}/events")
  end
  
  private
  
  def conn
    Faraday.new(:url => 'https://api.github.com/') do |faraday|
      faraday.headers["Authorization"] = "token #{@oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end