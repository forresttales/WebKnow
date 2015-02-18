class AlterRelateFollows1 < ActiveRecord::Migration
  def change
    
    add_column :relate_follows, :follower_id, :integer
    add_column :relate_follows, :followed_id, :integer
    
  end
end
