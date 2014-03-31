# == Schema Information
#
# Table name: journalposters
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#  price       :decimal(5, 2)
#

class Journalposter < ActiveRecord::Base
end
