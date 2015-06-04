class Comment

  attr_reader :username, :date, :comment

  def initialize(username, date, comment)
    @username = username
    @date = date
    @comment = comment
  end
  
end