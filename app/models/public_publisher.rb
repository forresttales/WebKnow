# == Schema Information
#
# Table name: publishers
#
#  id                         :integer          not null, primary key
#  name                       :string(100)
#  address                    :string(100)
#  city                       :string(100)
#  state                      :string(50)
#  country                    :string(100)
#  phone                      :string(100)
#  url                        :string(100)
#  description                :text
#  company_contact_name_first :string(100)
#  company_contact_name_last  :string(100)
#  company_contact_phone      :string(100)
#  company_contact_email      :string(100)
#  created_at                 :datetime
#  updated_at                 :datetime
#  user_id                    :integer
#  zip                        :string(255)
#

class PublicPublisher < Publisher
end
