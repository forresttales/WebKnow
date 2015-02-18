class AlterPublisherUsers8 < ActiveRecord::Migration
  def change
    
    add_column :publisher_users, :time_at_company, :string
    
  end
end
