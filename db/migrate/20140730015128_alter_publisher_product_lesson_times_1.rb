class AlterPublisherProductLessonTimes1 < ActiveRecord::Migration
  def change
      add_column :publisher_product_lesson_times, :lesson_time_pertinent_index, :integer, :default => 0
      add_column :publisher_product_lesson_times, :lesson_time_pertinent, :string
  end
end
