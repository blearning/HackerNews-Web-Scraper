class Post
  attr_accessor :title, :url, :points, :item_id, :comments_array

  def initialize(title, url, points, item_id, comments_array)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments_array = comments_array
  end

  def comments
    comments_array.each do |comment|
      puts "Username: #{comment.username}"
      puts "Date: #{comment.date}"
      puts "Comment: #{comment.comment}"
      puts "++++++++++++++++++++++++++++"
    end
  end

  def add_comment(comment)
    comments_array << comment
  end


end