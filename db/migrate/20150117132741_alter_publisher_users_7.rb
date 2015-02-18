class AlterPublisherUsers7 < ActiveRecord::Migration
  def change

    add_column :publisher_users, :name_company, :string

  end
end
