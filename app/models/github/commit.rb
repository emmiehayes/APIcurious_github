module Github
  class Commit 
    
    attr_reader :message
    
    def initialize(data)
      @message = data[:message]
    end
  end
end