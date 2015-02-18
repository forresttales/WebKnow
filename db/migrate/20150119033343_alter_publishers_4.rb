class AlterPublishers4 < ActiveRecord::Migration
  def change
    
    remove_column :publishers, :city
    remove_column :publishers, :state
    remove_column :publishers, :country

    add_column :publishers, :city, :string
    add_column :publishers, :state, :string
    add_column :publishers, :country, :string
        
  end
end

#  city            :string(100)
#  state           :string(50)
#  country         :string(100)
