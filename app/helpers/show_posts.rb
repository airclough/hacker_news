helpers do

  def date(date)
    date.strftime("%m/%d/%y %I:%M%p")
  end

  def post_body
    @post.body.gsub(/\n/,"<br><br>")
  end

  def comment_body(comment)
    comment.body.gsub(/\n/,"<br><br>")
  end

  def find_parent(id)
    post_id = Post.find(id).post_id
    return id unless post_id
    find_parent(post_id)
  end
end
