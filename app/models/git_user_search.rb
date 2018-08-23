class GitUserSearch 

  def initialize(oauth_token, username)
     @service = GithubService.new(oauth_token, username)
  end

  def find_user
    github_user = GithubUser.new(profile_data, repo_list, event_list)
  end

  private

  def profile_data 
    @service.raw_profile_data 
  end

  def repo_list
    @service.raw_repo_list.map do |repo|
       GithubRepo.new(repo)
    end 
  end

  def event_list
    @service.raw_event_list.map do |event|
       GithubEvent.new(event)
    end 
  end
end