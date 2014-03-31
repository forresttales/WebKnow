class CreateJournalposters < ActiveRecord::Migration
  def change
    create_table :journalposters do |t|

      t.timestamps
    end
  end
end
