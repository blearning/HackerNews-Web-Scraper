class Connect

  def connect(url)
    #connects to article
    #doc = Nokogiri::HTML(File.open(url))
    doc = Nokogiri::HTML(open(url))


    comments_array = []

    title = doc.search('.title').map {|title| title.text }
    title = title[1]
    url = 'URL SOON TO COME'
    points = doc.search('.score').map {|points| points.text }
    points = points[0]
    item_id = url.split('=')
    item_id = item_id.drop(1)[0].to_i
    article = Post.new(title, url, points, item_id, comments_array)

    number_of_comments =  doc.search('.default').map do |comment|
      
      #get username
      username = comment.search('.comhead a[1]').map do |comment|
        comment.text
      end

      #get date
      date = comment.search('.comhead a[2]').map do |comment|
        comment.text
      end

      #get comments
      comments = comment.search('.comment').map do |comment|
        comment.text
      end

      #push in comment array after correct information is extracted
      comment_post = Comment.new(username[0],date[0],comments[0])
      article.add_comment(comment_post)
    end
    #returns this as an object
    article
  end
end


