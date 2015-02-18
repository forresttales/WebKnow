class AlterPublisherUsers5 < ActiveRecord::Migration
  def change

    add_column :publisher_users, :email, :string

  end
end
