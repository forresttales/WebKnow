# == Schema Information
#
# Table name: post_user_files
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  post_user_id :integer
#  file         :string(255)
#  file_name    :string(255)
#  order        :integer
#

class PostUserFile < ActiveRecord::Base
  
  attr_accessible :user_id,
                  :post_user_id,
                  :file,
                  :file_name,
                  :order


  mount_uploader :file, PostUserFileUploader

  belongs_to :post_user


  def self.dbdelete
      self.connection.execute("DELETE FROM post_user_files")
  end

  def self.dbclear
      self.connection.execute("ALTER SEQUENCE post_user_files_id_seq RESTART WITH 1")
  end

  
end
