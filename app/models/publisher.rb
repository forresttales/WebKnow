# == Schema Information
#
# Table name: publishers
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#  zip             :string(255)
#  slug            :string(255)
#  name_company    :string(255)
#  address1        :string(255)
#  address2        :string(255)
#  website         :string(255)
#  phone_company   :string(255)
#  email_info      :string(255)
#  email_admin     :string(255)
#  name_admin      :string(255)
#  tagline_logo    :string(255)
#  city            :string(255)
#  state           :string(255)
#  country         :string(255)
#  story_corporate :text             default("")
#  id_gen          :integer
#  id_per          :string(255)      default("")
#  id_per_b        :boolean          default(FALSE)
#  slug_pre_id     :string(255)      default("")
#

class Publisher < ActiveRecord::Base
  
    attr_accessible :user_id,
                    :slug,
                    :name_company,                    
                    :address1,        
                    :address2,       
                    :city,            
                    :state,           
                    :country,                             
                    :zip,             
                    :phone_company,      
                    :website,         
                    :email_info,      
                    :email_admin,     
                    :name_admin,      
                    :tagline_logo,    
                    :story_corporate
  
  
    # extend FriendlyId
    # friendly_id :id, use: [:slugged, :history]

  
    belongs_to :user  
    
    has_one :issued_gen_id, foreign_key: "publisher_id"
    
    has_many :post_publisher_likes, dependent: :destroy
    has_many :post_publisher_comments, dependent: :destroy
    has_many :publisher_privileges, dependent: :destroy

    has_one :publisher_plot, dependent: :destroy
    has_one :publisher_product_current, dependent: :destroy
    
    
    # has_one :publisher_profile
    # has_one :publisher_setting
    # has_one :publisher_admin_setting

    has_many :publisher_users, dependent: :destroy
    has_many :publisher_members, dependent: :destroy

    has_many :publisher_products, dependent: :destroy    
    has_many :publisher_logo_images, dependent: :destroy
    has_many :publisher_logo_bkgrnd_images, dependent: :destroy
    # has_many :publisher_journalposters
    # has_many :journalposterpurchases
    has_many :publisher_posters, dependent: :destroy
    # has_many :posterpurchases
    
    has_many :post_publishers, dependent: :destroy 
    has_many :relate_publisher_follows, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relate_publisher_follows, source: :followed
    has_many :reverse_relate_publisher_follows, foreign_key: "followed_id", class_name: "RelatePublisherFollow", dependent: :destroy
    has_many :followers, through: :reverse_relate_publisher_follows, source: :follower
    
    has_many :log_publishers, dependent: :destroy

      
      
    def feed
      PostPublisher.from_users_followed_by(self)
    end
  
    def following?(other_user)
      relate_publisher_follows.find_by(followed_id: other_user.id)
    end
  
    def follow!(other_user)
      relate_publisher_follows.create!(followed_id: other_user.id)
    end
  
    def unfollow!(other_user)
      relate_publisher_follows.find_by(followed_id: other_user.id).destroy!
    end
        
    def feed_log
      LogPublisher.from_log_by(self)
    end
        
      
    def self.dbdelete
        self.connection.execute("DELETE FROM publishers")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE publishers_id_seq RESTART WITH 1")
    end
    
    
end

