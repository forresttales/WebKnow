class AlterPublisherUsers4 < ActiveRecord::Migration
  def change
    
    add_column :publisher_users, :location, :string    
    add_column :publisher_users, :alias, :string
    add_column :publisher_users, :job_title, :string
    add_column :publisher_users, :phone_company, :string
    add_column :publisher_users, :website, :string
    add_column :publisher_users, :years_at_company, :integer, :default => 0
    
  end
end

    # :location,
    # :alias,
    # :job_title,
    # :years_at_company,
    # :phone_company,
    # :website
