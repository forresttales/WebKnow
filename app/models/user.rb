# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name_first        :string(50)
#  name_last         :string(50)
#  email             :string(50)       default("")
#  username          :string(50)
#  password_digest   :string(255)
#  remember_token    :string(255)
#  has_account       :boolean          default(FALSE)
#  name_first        :string(50)
#  name_last         :string(50)
#  bd_day            :integer          default(0)
#  bd_month          :integer          default(0)
#  bd_year           :integer          default(0)
#  gender            :integer          default(0)
#  account_type      :integer          default(0)
#  account_type_text :string(255)
#  admin             :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime

class User < ActiveRecord::Base
  
  attr_accessible :name_first,
                  :name_last,
                  :email, 
                  :username, 
                  :account_type, 
                  :has_account, 
                  :password, 
                  :password_confirmation, 
                  :bd_month,
                  :bd_day,
                  :bd_year,
                  :gender,
                  :account_type,
                  :account_type_text
  
  
  
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
  
  
  def self.dbdelete
      self.connection.execute("DELETE FROM users")
  end
  
  def self.dbclear
      self.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1")
  end

  
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
