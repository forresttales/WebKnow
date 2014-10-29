class AlterPublisherProductDescriptions12 < ActiveRecord::Migration
  def change
    
    add_column :publisher_product_descriptions, :lesson_time_hours, :integer, :default => 0
    add_column :publisher_product_descriptions, :lesson_time_minutes, :integer, :default => 0
    add_column :publisher_product_descriptions, :course_time_hours, :integer, :default => 0
    add_column :publisher_product_descriptions, :course_time_days, :integer, :default => 0
    add_column :publisher_product_descriptions, :course_time_months, :integer, :default => 0
    add_column :publisher_product_descriptions, :time_per_lesson, :boolean, :default => false
    add_column :publisher_product_descriptions, :time_per_course, :boolean, :default => false
    
  end
end
