class GithubUser 

  attr_reader :name, :avatar_url, :followers, :following, :starred, :repos
  
  def initialize(data)
    @name       = data[:name]
    @avatar_url = data[:avatar_url]
    @followers  = data[:followers]
    @following  = data[:following]
    # @starred    = data[:starred_url]
    # @repos      = data[:repos_url]
  end
end