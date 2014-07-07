class AlterUsers5 < ActiveRecord::Migration
  def change

      add_column :users, :auth_token, :string, :limit => 255    
      add_column :users, :password_reset_token, :string, :limit => 255    
      add_column :users, :password_reset_sent_at, :datetime    

  end
end

#  password_reset_token   :string(255)
#  auth_token             :string(255)
#  password_reset_sent_at :datetime
