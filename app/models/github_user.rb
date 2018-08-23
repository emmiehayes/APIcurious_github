class GithubUser 

  attr_reader :name, :avatar_url, :followers, :following, :repositories, :events
  
  def initialize(profile_data, repo_list, event_list)
    @name         = profile_data[:name]
    @avatar_url   = profile_data[:avatar_url]
    @followers    = profile_data[:followers]
    @following    = profile_data[:following]
    @repositories = repo_list
    @events       = event_list
  end
end