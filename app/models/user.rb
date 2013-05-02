class User < ActiveRecord::Base
  include BCrypt
  has_many :posts
  validates :username, :confirmation => true, :uniqueness => true
  # validates :username_confirmation, :presence => true
  validates :password_hash, :presence => true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authentic?(params)
    @user = User.find_by_username(params[:username])
    @user.password == params[:password]
  end

end

