class GitUserSearch 

  def initialize(oauth_token, username)
     @service = GithubService.new(oauth_token, username)
  end

  def find_user 
    github_user = GithubUser.new(profile_data, repo_list)
  end

  def profile_data 
    @service.raw_user 
  end

  def repo_list
    @service.raw_user_repos.map do |repo|
      GithubRepo.new(repo)
    end
  end
end