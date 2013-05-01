class User < ActiveRecord::Base
  include BCrypt

  validates :username, :confirmation => true
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

