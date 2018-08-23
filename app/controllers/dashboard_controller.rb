class DashboardController < ApplicationController 

  def show 
    @github_user = GitUserSearch.new(current_user.oauth_token).find_user
  end
end