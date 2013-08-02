# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy

  before_save do |user|
    user.email.downcase!
  end

  before_create(:create_remember_token)


  validates	:name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    format:   { with: /\A[\w+\-.]+@[a-z\d\-.]+.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def feed
    Micropost.where("user_id = ?", id)
  end


  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
