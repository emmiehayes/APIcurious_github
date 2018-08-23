class GitUserSearch 

  def initialize(oauth_token)
     @service = GithubService.new(oauth_token)
  end

  def find_user 
    github_user = GithubUser.new(data)
  end

  def data 
    @service.raw_user
  end
end