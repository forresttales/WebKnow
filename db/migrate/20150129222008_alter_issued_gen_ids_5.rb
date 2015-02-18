class AlterIssuedGenIds5 < ActiveRecord::Migration
  def change
    
    remove_column :issued_gen_ids, :gen_id
    
    add_column :issued_gen_ids, :gen_id, :bigint
    add_index :issued_gen_ids, :gen_id, unique: true

    add_column :issued_gen_ids, :user_id, :bigint         
    add_index :issued_gen_ids, :user_id, unique: true

    add_column :issued_gen_ids, :student_id, :bigint          
    add_index :issued_gen_ids, :student_id, unique: true

    add_column :issued_gen_ids, :teacher_id, :bigint          
    add_index :issued_gen_ids, :teacher_id, unique: true

    add_column :issued_gen_ids, :publisher_id, :bigint          
    add_index :issued_gen_ids, :publisher_id, unique: true

    add_column :issued_gen_ids, :institute_id, :bigint          
    add_index :issued_gen_ids, :institute_id, unique: true

    add_column :issued_gen_ids, :recruiter_id, :bigint         
    add_index :issued_gen_ids, :recruiter_id, unique: true

    
  end
end
