# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  email           :string(50)       default("")
#  username        :string(50)
#  password_digest :string(255)
#  remember_token  :string(255)
#  account_type    :string(50)
#  has_account     :boolean          default(FALSE)
#  name_first      :string(50)
#  name_last       :string(50)
#

#  admin           :boolean          default(FALSE)
#  name_first      :string(50)
#  name_last       :string(50)
#

class User < ActiveRecord::Base
  
  attr_accessible :id, 
                  :name_first,
                  :name_last,
                  :email, 
                  :username, 
                  :account_type, 
                  :has_account, 
                  :password, 
                  :password_confirmation, 
                  :created_at, 
                  :updated_at
  
  
  
  has_one :institute, dependent: :destroy
  has_one :publisher, dependent: :destroy
  has_one :recruiter, dependent: :destroy
  has_one :student, dependent: :destroy
  has_one :teacher, dependent: :destroy
  
  
  # has_many :microposts, dependent: :destroy
  # has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  # has_many :followed_users, through: :relationships, source: :followed
  # has_many :reverse_relationships, foreign_key: "followed_id",
                                   # class_name: "Relationship",
                                   # dependent: :destroy
  # has_many :followers, through: :reverse_relationships, source: :follower

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 4 }
    
    
    def User.new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
    
    
    
    
    # def feed
      # Micropost.from_users_followed_by(self)
    # end
#   
    # def following?(other_user)
      # relationships.find_by(followed_id: other_user.id)
    # end
#   
    # def follow!(other_user)
      # relationships.create!(followed_id: other_user.id)
    # end
#   
    # def unfollow!(other_user)
      # relationships.find_by(followed_id: other_user.id).destroy!
    # end
  
    private
  
      def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
      end
    
    
    
    
    
    # def self.authenticate(username="", password="")
      # user = Register.find_by_username(username)
      # if user && user.password_match?(password)
        # return user
      # else
        # return false
      # end
    # end
#   
    # def password_match?(password="")
      # hashed_password == Register.hash_with_salt(password, salt)
    # end
#     
    # def self.make_salt(username="")
      # Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
    # end
#     
    # def self.hash_with_salt(password="", salt="")
      # Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
    # end
#     
    # private
#     
    # def create_hashed_password
      # unless password.blank?
        # self.salt = Register.make_salt(username) if salt.blank?
        # self.hashed_password = Register.hash_with_salt(password, salt)
      # end
    # end
#   
    # def clear_password
      # self.password = nil
    # end
    
  
end
