helpers do
  def show_comments
    comments = []
    Comment.order('created_at DESC').limit(30).each do |comment|
      comments << comment
    end
    comments
  end
end
