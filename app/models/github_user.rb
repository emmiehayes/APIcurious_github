class GithubUser 

  attr_reader :name, :avatar_url, :followers, :following, :repositories
  
  def initialize(profile_data, repo_list)
    @name         = profile_data[:name]
    @avatar_url   = profile_data[:avatar_url]
    @followers    = profile_data[:followers]
    @following    = profile_data[:following]
    @repositories = repo_list
  end
end