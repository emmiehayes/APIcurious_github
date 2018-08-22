class GithubUser 

  attr_reader :name, :avatar_url, :followers, :following
  
  def initialize(data)
    @name       = data[:name]
    @avatar_url = data[:avatar_url]
    @followers  = data[:followers]
    @following  = data[:following]
  end
end