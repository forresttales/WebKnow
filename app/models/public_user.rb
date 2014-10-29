# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(50)       default("")
#  username               :string(50)
#  password_digest        :string(255)
#  remember_token         :string(255)
#  has_account            :boolean          default(FALSE)
#  name_first             :string(50)
#  name_last              :string(50)
#  bd_day                 :integer          default(0)
#  bd_month               :integer          default(0)
#  bd_year                :integer          default(0)
#  gender                 :integer          default(0)
#  account_type           :integer          default(0)
#  account_type_text      :string(255)
#  bd_month_text          :string(255)
#  gender_text            :string(255)
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  avatar                 :string(255)
#

class PublicUser < User
    
end
