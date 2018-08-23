class GithubCommit 

  attr_reader :message

  def initialize(data)
    @message = data[:message]
  end
end