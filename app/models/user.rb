# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(50)       default("")
#  username               :string(50)
#  password_digest        :string(255)
#  remember_token         :string(255)
#  has_account            :boolean          default(FALSE)
#  name_first             :string(50)
#  name_last              :string(50)
#  bd_day                 :integer          default(0)
#  bd_month               :integer          default(0)
#  bd_year                :integer          default(0)
#  gender                 :integer          default(0)
#  bd_month_text          :string(255)
#  gender_text            :string(255)
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  id_gen                 :integer          default(0)
#  id_per                 :string(255)      default("")
#  slug                   :string(200)
#  avatar_image           :string(255)
#  slug_pre_id            :string(255)
#  id_per_b               :boolean          default(FALSE)
#  profile_type           :integer          default(0)
#  profile_type_text      :string(255)
#  new_user               :boolean          default(TRUE)
#

class User < ActiveRecord::Base
  
  # attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  # attr_accessor   :new_user
  
  # attr_accessible :id,
  attr_accessible :slug,
                  :name_first,
                  :name_last,
                  :email, 
                  :username, 
                  :profile_type,
                  :profile_type_text,
                  # :has_profile, 
                  :password, 
                  :password_confirmation, 
                  :bd_month,
                  :bd_month_text,
                  :bd_day,
                  :bd_year,
                  :gender,
                  :gender_text,
                  :avatar_image,
                  :new_user
                  # :slug_pre_id
  
  
  # extend FriendlyId
  # friendly_id :id, use: [:slugged, :history]
  
  has_one :issued_gen_id, foreign_key: "user_id"

  has_many :user_images
  has_many :user_bkgrnd_images, dependent: :destroy
  has_many :post_users 
  
  has_many :post_user_likes, dependent: :destroy
  has_many :post_user_comments, dependent: :destroy
  has_many :log_users, dependent: :destroy    # ? possibly delete this

  has_many :relate_follows, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relate_follows, source: :followed
  has_many :reverse_relate_follows, foreign_key: "followed_id", class_name: "RelateFollow", dependent: :destroy
  has_many :followers, through: :reverse_relate_follows, source: :follower
  
  
  has_one :publisher_user, dependent: :destroy  
  has_one :publisher
  
  
  

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  # validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, on: :create
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
    
  # has_secure_password
  # validates_presence_of :password, :on => :create
  # before_create { generate_token(:auth_token) }

    
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
    

  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
    
    
  
  def feed
    PostUser.from_users_followed_by(self)
  end

  def following?(other_user)
    relate_follows.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relate_follows.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relate_follows.find_by(followed_id: other_user.id).destroy!
  end


  def feed_log
    LogUser.from_log_by(self)
  end
  
  
  
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
