class DashboardController < ApplicationController 

  def show 
    conn = Faraday.new(:url => "https://api.github.com/") do |faraday|
      faraday.headers["Authorization"] = "token #{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
    user_response = conn.get("/user")
    @github_user = GithubUser.new(JSON.parse(user_response.body, symbolize_names: true))
  end
end