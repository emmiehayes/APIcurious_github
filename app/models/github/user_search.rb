module Github
  class UserSearch 

    def initialize(oauth_token, username)
      @service = Github::Service.new(oauth_token, username)
    end

    def find_user
      github_user = Github::User.new(profile_data, repo_list, event_list)
    end

    private

    def profile_data 
      @service.raw_profile_data 
    end

    def repo_list
      @service.raw_repo_list.map do |repo|
        Repo.new(repo)
      end 
    end

    def event_list
      @service.raw_event_list.map do |event|
        Event.new(event)
      end 
    end
  end
end