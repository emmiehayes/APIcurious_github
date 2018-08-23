class DashboardController < ApplicationController 

  def show 
    @github_user = GitUserSearch.new(current_user.oauth_token, current_user.username).find_user
  end
end