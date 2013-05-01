helpers do
  def show_posts
    posts = []
    Post.order('created_at DESC').limit(30).each do |post|
      posts << post
    end
    posts
  end
end
