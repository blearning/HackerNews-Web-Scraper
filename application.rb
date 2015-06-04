class Application

  attr_accessor :post

  def connect(url)
    connect = Connect.new
    @post = connect.connect(url)
  end
  def read_details
    puts "Title: #{@post.title}"
    puts "Points: #{@post.points}"
    puts "Comments: #{@post.comments_array.length}"
  end
  def read_comments
    puts @post.comments
  end
  
end