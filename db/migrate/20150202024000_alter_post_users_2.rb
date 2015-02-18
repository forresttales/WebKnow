class AlterPostUsers2 < ActiveRecord::Migration
  def change

    add_column :post_users, :b_group, :boolean, :default => false

  end
end
